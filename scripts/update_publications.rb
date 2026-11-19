# Refresh the bibliography from HAL and Semantic Scholar (Google Scholar has no API).
# Each member with `hal_id` or `semantic_scholar_id` in _data/authors.yml is included.
# Existing entries are never removed; failures keep the current bibliography.
require "bibtex"
require "date"
require "json"
require "open-uri"
require "uri"
require "yaml"

def arxiv_id(text)
  text.to_s[%r{arxiv(?:\.org/abs/|:|\.)\s*(\d{4}\.\d{4,5}(?:v\d+)?)}i, 1]&.downcase
end

def identifiers(entry)
  doi = entry[:doi].to_s.downcase.sub(%r{\Ahttps?://(?:dx\.)?doi.org/}, "").strip
  hal = [entry[:hal_id], entry[:hal], entry[:url]].join(" ")[/(?:hal|tel)-\d+/]
  arxiv = arxiv_id([entry[:arxiv], entry[:doi], entry[:journal], entry[:url]].join(" "))
  title = entry.convert(:latex).title.to_s.unicode_normalize(:nfkd)
    .gsub(/\p{Mn}/, "").downcase.gsub(/[^a-z0-9]/, "")
  [doi.empty? ? nil : "doi:#{doi}", hal && "hal:#{hal}", arxiv && "arxiv:#{arxiv}",
   title.empty? ? nil : "title:#{title}"].compact
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
  bibliography = BibTeX.parse(source, parse_months: false)
  incoming = BibTeX.parse(response, parse_months: false).query("@*")
  incoming.reject! { |entry| entry[:note].to_s.strip.casecmp?("Lecture") }
  incoming.select! { |entry| entry[:title] && entry[:author] && entry[:year] }
  incoming.sort_by! { |entry| published?(entry) ? 0 : 1 } # published versions first, then their preprints
  raise "No usable references" if incoming.empty?
  index = {}
  bibliography.query("@*").each { |entry| identifiers(entry).each { |id| index[id] = entry } }
  updates = {}
  added = []
  incoming.each do |entry|
    entry[:hal] = "https://hal.science/#{entry[:hal_id]}" if entry[:hal_id]
    existing = identifiers(entry).filter_map { |id| index[id] }.first
    if existing
      next if existing[:scope].to_s == "hidden"
      before = existing.to_s
      promote = preprint?(existing) && published?(entry)
      fields = promote ? entry.field_names : %i[doi hal arxiv pdf pages volume number month]
      fields.each do |field|
        existing[field] = entry[field] if entry[field] && (promote || existing[field].to_s.empty?)
      end
      existing.type = entry.type if promote
      updates[existing.key] = existing.to_s if existing.to_s != before
      entry = existing
    else
      entry.key = "#{entry.key}b" while bibliography[entry.key]
      bibliography.add(entry)
      added << entry.to_s
    end
    identifiers(entry).each { |id| index[id] = entry }
  end
  parts = source.split(/(?=^@)/)
  output = parts.map do |part|
    key = part[/\A@\w+\s*\{\s*([^,]+),/, 1]
    updates.key?(key) ? "#{updates[key]}\n" : part
  end.join
  output = output.rstrip + "\n\n" + added.join("\n") unless added.empty?
  unless output == source
    File.write("#{path}.tmp", output)
    File.rename("#{path}.tmp", path)
  end
  "#{added.size} new references, #{updates.size} updated"
end

def hal(id)
  uri = URI("https://api.archives-ouvertes.fr/search/")
  uri.query = URI.encode_www_form(q: "authIdHal_s:#{id}", fq: "-docType_s:LECTURE", rows: 1000, wt: "bibtex")
  uri.open(open_timeout: 10, read_timeout: 30).read
end

def semantic_scholar(id)
  uri = URI("https://api.semanticscholar.org/graph/v1/author/#{id}/papers")
  uri.query = URI.encode_www_form(limit: 1000, fields: "title,authors,year,publicationDate,venue,journal,externalIds")
  sleep 2 # stay under the shared rate limit of the free API
  semantic_scholar_bibtex(uri.open(open_timeout: 10, read_timeout: 30).read)
end

# Converts Semantic Scholar papers to BibTeX. Records without a DOI or arXiv ID are skipped.
def semantic_scholar_bibtex(json)
  JSON.parse(json)["data"].filter_map do |paper|
    ids = paper["externalIds"] || {}
    arxiv = ids["ArXiv"] || arxiv_id(ids["DOI"])
    doi = ids["DOI"] unless ids["DOI"].to_s.downcase.start_with?("10.48550/")
    venue = paper.dig("journal", "name") || paper["venue"]
    venue = nil if venue.to_s.match?(/\A(arxiv(\.org)?)?\z/i)
    next unless paper["title"] && paper["year"] && paper["authors"]&.any? && (arxiv || doi)

    authors = paper["authors"].map { |author| author["name"] }
    # A venue such as "2024 IEEE ICRA" gives the publication year; S2 dates are often arXiv dates.
    year = (doi && venue.to_s[/\b(?:19|20)\d\d\b/]) || paper["year"].to_s
    date = paper["publicationDate"].to_s
    fields = { title: paper["title"], author: authors.join(" and "), year: year }
    fields[:month] = Date::ABBR_MONTHNAMES[date[5, 2].to_i].downcase if date.start_with?(year)
    fields[:arxiv] = "https://arxiv.org/abs/#{arxiv}" if arxiv
    if doi && venue
      type = venue.match?(/conference|workshop|proceedings|symposium/i) ? :inproceedings : :article
      fields.merge!(doi: doi, (type == :article ? :journal : :booktitle) => venue)
    elsif arxiv
      type = :article
      fields[:journal] = "arXiv preprint arXiv:#{arxiv}"
    else
      next
    end
    key = "#{authors.first.split.last}#{year}#{paper['title'][/[A-Za-z]{4,}/]}"
      .unicode_normalize(:nfkd).downcase.gsub(/[^a-z0-9]/, "")
    BibTeX::Entry.new(fields.merge(bibtex_type: type, bibtex_key: key)).to_s
  end.join("\n")
end

if $PROGRAM_NAME == __FILE__
  root = File.expand_path("..", __dir__)
  path = File.join(root, "_bibliography/references.bib")
  YAML.load_file(File.join(root, "_data/authors.yml"), permitted_classes: [Date]).each_value do |person|
    { "HAL" => person["hal_id"], "Semantic Scholar" => person["semantic_scholar_id"] }.each do |name, id|
      next unless id
      response = name == "HAL" ? hal(id) : semantic_scholar(id)
      puts "#{name} (#{person['name']}): #{refresh(path, response)}."
    rescue StandardError => error
      puts "::warning::#{name} (#{person['name']}) unavailable: #{error.message}. Keeping the existing bibliography."
    end
  end
end
