require "tmpdir"
require_relative "update_publications"

def check(condition, message)
  raise message unless condition
end

Dir.mktmpdir("rleaf-publications") do |directory|
  path = File.join(directory, "references.bib")
  File.write(path, <<~BIB)
    @article{verified,
      title={Verified paper}, author={Author, Alice}, year={2025},
      journal={Published Journal}, doi={10.1000/published}
    }
    @article{personal,
      title={Norlab work}, author={Author, Alice}, year={2025},
      hal={https://hal.science/hal-00000002}, scope={personal}
    }
    @unpublished{preprint,
      title={A developing paper}, author={Author, Alice}, year={2025},
      doi={10.48550/arXiv.1234}, hal={https://hal.science/hal-00000003}
    }
  BIB
  response = <<~BIB
    @unpublished{hal-version,
      title={Verified paper}, author={Author, Alice}, year={2026},
      doi={10.1000/PUBLISHED}, hal_id={hal-00000001}
    }
    @article{personal-version,
      title={Norlab work}, author={Author, Alice}, year={2026},
      journal={Another Journal}, doi={10.1000/personal}, hal_id={hal-00000002}
    }
    @article{published-version,
      title={A developing paper}, author={Author, Alice}, year={2026},
      journal={A Journal}, doi={10.1000/new-publication}, hal_id={hal-00000003}
    }
    @inproceedings{new-without-md,
      title={A paper without a writeup}, author={Author, Alice}, year={2026},
      booktitle={A Conference}, hal_id={hal-00000004}
    }
  BIB
  refresh(path, response)
  once = File.read(path)
  bibliography = BibTeX.parse(once)
  check(bibliography.query("@*").size == 4, "Import duplicated or lost references")
  check(bibliography["verified"][:year].to_s == "2025", "HAL replaced a verified year")
  check(bibliography["verified"][:journal].to_s == "Published Journal", "HAL downgraded a journal paper")
  check(bibliography["verified"][:hal].to_s.end_with?("hal-00000001"), "HAL source link is missing")
  check(bibliography["personal"][:scope].to_s == "personal", "Personal scope was lost")
  check(bibliography["personal"][:year].to_s == "2025", "Personal work was changed")
  check(bibliography["preprint"][:doi].to_s == "10.1000/new-publication", "Published DOI was not updated")
  check(bibliography["preprint"].type == :article, "Publication type was not updated")
  check(bibliography["new-without-md"], "Import incorrectly requires a Markdown page")
  refresh(path, response)
  check(File.read(path) == once, "Refreshing twice changed the bibliography")
  begin
    refresh(path, "<html>Service unavailable</html>")
    raise "An invalid response was accepted"
  rescue RuntimeError => error
    raise unless error.message == "HAL returned no usable references"
  end
  check(File.read(path) == once, "An API failure changed the bibliography")
end

puts "Publication sync checks passed."
