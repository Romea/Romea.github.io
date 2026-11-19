require "bibtex"

Jekyll::Hooks.register :site, :post_read do |site|
  bibliography = BibTeX.open(File.join(site.source, "_bibliography/references.bib"))
  publications = []
  site.collections.fetch("research").docs.each do |page|
    next if page.data["status"] == "ongoing"
    next unless page.data["reference"] || page.data["paper"]

    entry = bibliography[page.data["reference"]]&.convert(:latex)
    fields = %w[doi arxiv hal pdf publisher_url]
    paper = fields.to_h { |field| [field, entry&.[](field)&.to_s] }.compact
    if entry
      paper.merge!(
        "title" => entry.title.to_s,
        "authors" => entry.author.map { |name| [name.first, name.last].join(" ") },
        "conference" => entry[:booktitle]&.to_s,
        "journal" => entry[:journal]&.to_s
      )
    end
    paper.merge!(page.data.fetch("paper", {}))
    paper["title"] ||= page.data["title"]
    paper["year"] = (page.data["publication_date"] || page.data["year"]).to_s[0, 4]
    if (source = paper["pdf"]) && !source.match?(%r{\Ahttps?://})
      paper["source_pdf"] = source
      paper["pdf"] = "#{page.url}paper.pdf"
    end
    page.data["paper"] = paper

    source_url = paper["publisher_url"]
    source_url ||= "https://doi.org/#{paper['doi']}" if paper["doi"]
    source_url ||= paper["arxiv"] || paper["hal"]
    publications << paper.merge(
      "reference" => page.data["reference"], "url" => page.url,
      "source_url" => source_url, "date" => page.data["publication_date"].to_s,
      "status" => page.data.fetch("publication_status", "preprint"),
      "type" => page.data["publication_type"], "venue" => page.data["venue"],
      "image" => page.data.dig("header", "teaser"),
      "alt" => page.data["image_alt"] || page.data["title"],
      "image_fit" => page.data["image_fit"], "image_credit" => page.data["image_credit"],
      "summary" => page.data["excerpt"],
      "byline" => "#{paper.fetch('authors', []).first.to_s.split.last} et al."
    )
  end
  site.data["publications"] = publications.sort_by { |paper| [paper["date"], paper["title"]] }.reverse
  site.data["home_publications"] = site.data["publications"].select do |paper|
    paper["status"] == "published" && %w[journal conference].include?(paper["type"])
  end.first(3)
end

Jekyll::Hooks.register :site, :post_write do |site|
  site.collections.fetch("research").docs.each do |page|
    next unless source = page.data.dig("paper", "source_pdf")

    FileUtils.cp(File.join(site.source, source), File.join(site.dest, page.data["paper"]["pdf"]))
  end
end
