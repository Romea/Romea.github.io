require "bibtex"

Jekyll::Hooks.register :site, :post_write do |site|
  bibliography = BibTeX.open(File.join(site.source, "_bibliography/references.bib"))
  entries = bibliography.query("@*[scope != personal]")
  File.write(File.join(site.dest, "publications.bib"), entries.join("\n\n"))
end
