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
    @article{hidden,
      title={Hidden work}, author={Author, Alice}, year={2025},
      hal={https://hal.science/hal-00000002}, scope={hidden}
    }
    @unpublished{preprint,
      title={A developing paper}, author={Author, Alice}, year={2025},
      doi={10.48550/arXiv.1234}, hal={https://hal.science/hal-00000003}
    }
    @inproceedings{renamed,
      title={Final title}, author={Author, Alice}, year={2023},
      booktitle={A Conference}, arxiv={https://arxiv.org/abs/2303.06511}
    }
  BIB
  hal = <<~BIB
    @unpublished{hal-version,
      title={Verified paper}, author={Author, Alice}, year={2026},
      doi={10.1000/PUBLISHED}, hal_id={hal-00000001}, month=sep
    }
    @article{hidden-version,
      title={Hidden work}, author={Author, Alice}, year={2026},
      journal={Another Journal}, doi={10.1000/hidden}, hal_id={hal-00000002}
    }
    @article{published-version,
      title={A developing paper}, author={Author, Alice}, year={2026},
      journal={A Journal}, doi={10.1000/new-publication}, hal_id={hal-00000003}
    }
    @inproceedings{new-without-md,
      title={A paper without a writeup}, author={Author, Alice}, year={2026},
      booktitle={A Conference}, hal_id={hal-00000004}
    }
    @misc{incomplete, title={No author or year}}
  BIB
  semantic_scholar = semantic_scholar_bibtex(JSON.generate("data" => [
    { "title" => "Early title", "year" => 2023, "authors" => [{ "name" => "Alice Author" }],
      "externalIds" => { "DOI" => "10.48550/arXiv.2303.06511" }, "venue" => "arXiv.org" },
    { "title" => "A new preprint", "year" => 2026, "publicationDate" => "2026-11-17",
      "authors" => [{ "name" => "Alice Author" }], "externalIds" => { "ArXiv" => "2611.23120" } },
    { "title" => "No identifier", "year" => 2026, "authors" => [{ "name" => "Alice Author" }], "externalIds" => {} },
    { "title" => "Conference version", "year" => 2023, "publicationDate" => "2023-09-20",
      "authors" => [{ "name" => "Alice Author" }], "externalIds" => { "DOI" => "10.1109/ICRA.2024.1" },
      "journal" => { "name" => "2024 IEEE International Conference on Robotics and Automation (ICRA)" } }
  ]))
  refresh(path, hal)
  refresh(path, semantic_scholar)
  once = File.read(path)
  bibliography = BibTeX.parse(once)
  check(bibliography.query("@*").size == 7, "Import duplicated or lost references")
  check(bibliography["verified"][:year].to_s == "2025", "HAL replaced a verified year")
  check(bibliography["verified"][:journal].to_s == "Published Journal", "HAL downgraded a journal paper")
  check(bibliography["verified"][:hal].to_s.end_with?("hal-00000001"), "HAL source link is missing")
  check(bibliography["verified"][:month].to_s == "sep", "An empty month was not filled")
  check(bibliography["hidden"][:year].to_s == "2025", "A hidden entry was changed")
  check(bibliography["preprint"][:doi].to_s == "10.1000/new-publication", "Published DOI was not updated")
  check(bibliography["preprint"].type == :article, "Publication type was not updated")
  check(bibliography["new-without-md"], "Import incorrectly requires a Markdown page")
  check(bibliography["renamed"][:title].to_s == "Final title", "An earlier arXiv title created a duplicate")
  check(bibliography["author2026preprint"][:month].to_s == "nov", "Semantic Scholar preprint was not added")
  check(!once.include?("month_numeric"), "Internal month field was written")
  conference = bibliography["author2024conference"]
  check(conference && conference[:booktitle].to_s.include?("ICRA") && !conference[:month],
        "A conference paper did not take the year of its venue")
  refresh(path, hal)
  refresh(path, semantic_scholar)
  check(File.read(path) == once, "Refreshing twice changed the bibliography")
  begin
    refresh(path, "<html>Service unavailable</html>")
    raise "An invalid response was accepted"
  rescue RuntimeError => error
    raise unless error.message == "No usable references"
  end
  check(File.read(path) == once, "An API failure changed the bibliography")
end

puts "Publication sync checks passed."
