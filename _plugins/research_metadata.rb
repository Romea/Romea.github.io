require "bibtex"

Jekyll::Hooks.register :site, :post_read do |site|
  bibliography = BibTeX.open(File.join(site.source, "_bibliography/references.bib"))
  site.data.fetch("home_publications", []).each do |publication|
    entry = bibliography[publication.fetch("reference")].convert(:latex)
    publication["title"] = entry.title.to_s
    publication["url"] = entry[:publisher_url]&.to_s || entry[:arxiv]&.to_s || "https://doi.org/#{entry[:doi]}"
    publication["byline"] = "#{entry.author.first.last} et al."
  end
  site.collections.fetch("research").docs.each do |page|
    next unless page.data["reference"]
    next unless entry = bibliography[page.data["reference"]]

    entry = entry.convert(:latex)
    page.data["paper"] = (page.data["paper"] || {}).merge(
      "title" => entry.title.to_s,
      "authors" => entry.author.map { |name| [name.first, name.last].join(" ") },
      "year" => entry.year.to_s,
      "conference" => entry[:booktitle]&.to_s,
      "journal" => entry[:journal]&.to_s,
      "doi" => entry[:doi]&.to_s
    )
    next unless pdf = page.data["paper"]["pdf"]

    page.data["paper"]["source_pdf"] = pdf
    page.data["paper"]["pdf"] = "#{page.url}paper.pdf"
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  site.collections.fetch("research").docs.each do |page|
    next unless source = page.data.dig("paper", "source_pdf")

    FileUtils.cp(File.join(site.source, source), File.join(site.dest, page.data["paper"]["pdf"]))
  end
end
