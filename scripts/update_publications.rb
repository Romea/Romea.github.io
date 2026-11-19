# Refresh public HAL records without depending on research writeup pages.
require "bibtex"
require "open-uri"
require "uri"

def identifiers(entry)
  doi = entry[:doi].to_s.downcase.sub(%r{\Ahttps?://(?:dx\.)?doi.org/}, "").strip
  hal = [entry[:hal_id], entry[:hal], entry[:url]].join(" ")[/(?:hal|tel)-\d+/]
  title = entry.convert(:latex).title.to_s.unicode_normalize(:nfkd)
    .gsub(/\p{Mn}/, "").downcase.gsub(/[^a-z0-9]/, "")
  [doi.empty? ? nil : "doi:#{doi}", hal && "hal:#{hal}", title.empty? ? nil : "title:#{title}"].compact
end

def preprint?(entry)
  entry.type == :unpublished || entry[:journal].to_s.downcase.include?("arxiv") ||
    entry[:doi].to_s.downcase.start_with?("10.48550/arxiv")
end

def published?(entry)
  %i[article inproceedings].include?(entry.type) && !entry[:doi].to_s.empty? &&
    !entry[:doi].to_s.downcase.start_with?("10.48550/") &&
    ![entry[:journal], entry[:booktitle]].join.empty?
end

def refresh(path, response)
  source = File.read(path)
  bibliography = BibTeX.parse(source)
  incoming = BibTeX.parse(response).query("@*")
  incoming.reject! { |entry| entry[:note].to_s.strip.casecmp?("Lecture") }
  raise "HAL returned no usable references" if incoming.empty?
  index = {}
  bibliography.query("@*").each { |entry| identifiers(entry).each { |id| index[id] = entry } }
  updates = {}
  added = []
  incoming.each do |entry|
    raise "Incomplete HAL reference" unless entry[:title] && entry[:author] && entry[:year]
    entry[:hal] = "https://hal.science/#{entry[:hal_id]}" if entry[:hal_id]
    existing = identifiers(entry).filter_map { |id| index[id] }.first
    if existing
      next if existing[:scope].to_s == "personal"
      before = existing.to_s
      promote = preprint?(existing) && published?(entry)
      fields = promote ? entry.field_names : %i[doi hal pdf pages volume number]
      fields.each do |field|
        existing[field] = entry[field] if entry[field] && (promote || existing[field].to_s.empty?)
      end
      existing.type = entry.type if promote
      updates[existing.key] = existing.to_s if existing.to_s != before
      entry = existing
    else
      raise "Duplicate citation key: #{entry.key}" if bibliography[entry.key]
      bibliography.add(entry)
      added << entry.to_s
    end
    identifiers(entry).each { |id| index[id] = entry }
  end
  parts = source.split(/(?=^@)/)
  output = parts.map do |part|
    key = part[/\A@\w+\s*\{\s*([^,]+)/, 1]
    updates.key?(key) ? "#{updates[key]}\n" : part
  end.join
  output = output.rstrip + "\n\n" + added.join("\n") unless added.empty?
  unless output == source
    File.write("#{path}.tmp", output)
    File.rename("#{path}.tmp", path)
  end
  puts "HAL: #{added.size} new references, #{updates.size} updated; existing citation keys retained."
end

if $PROGRAM_NAME == __FILE__
  begin
    author = ARGV.fetch(0, "johann-laconte")
    uri = URI("https://api.archives-ouvertes.fr/search/")
    uri.query = URI.encode_www_form(q: "authIdHal_s:#{author}", fq: "-docType_s:LECTURE", rows: 1000, wt: "bibtex")
    response = uri.open(open_timeout: 10, read_timeout: 30).read
    refresh(File.expand_path("../_bibliography/references.bib", __dir__), response)
  rescue StandardError => error
    warn "HAL refresh unavailable: #{error.message}. Keeping the existing bibliography."
  end
end
