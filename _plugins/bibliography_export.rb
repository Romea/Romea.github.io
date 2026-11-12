Jekyll::Hooks.register :site, :post_write do |site|
  FileUtils.cp(
    File.join(site.source, "_bibliography", "references.bib"),
    File.join(site.dest, "publications.bib")
  )
end
