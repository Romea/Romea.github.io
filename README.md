# R-LEAF website

A static Jekyll site for the Robotics Laboratory for the Environment and
Autonomous Farming at INRAE. Built with Minimal Mistakes and Jekyll Scholar.

## Run locally

Use Ruby 3.4, as specified in `.ruby-version`, and Bundler:

```sh
bundle install
bundle exec jekyll serve
```

Open http://localhost:4000. To check the production build:

```sh
JEKYLL_ENV=production bundle exec jekyll build
python3 scripts/check_site.py
```

Commit `Gemfile.lock` when changing dependencies. CI builds and checks pull
requests; deployment only runs after a push to `master` or `main`.

## Edit content

- `index.md` contains the laboratory introduction and selects the featured research.
- `_research/` contains project summaries. Use `reference` for the matching BibTeX key,
  `year` for ordering and `header.teaser` for a square preview. Use `status: ongoing` for a current project.
- `_data/projects.yml` lists collective projects, their institutional context and
  official sources. It supplies the projects page and `llms.txt`. Keep R-LEAF's
  activities distinct from collaborations involving the wider TSCF unit; only add
  dates, partners and roles supported by the linked source.
- `_bibliography/references.bib` supplies the publications page, project citations
  and each person's publication list. Filter personal lists by author rather than
  copying references into separate files. Retain existing citation keys when
  updating a preprint to its published version; link a specific arXiv version
  when titles or authors have changed.
- Research pages with a `reference` get citation metadata from that bibliography.
  A local `paper.pdf` is also served beside the article page when a PDF is provided,
  so its citation metadata can identify the full text.
- `_data/authors.yml` holds member details; `_people/` contains biographies.
  Both current and past positions can link to the same biography.
- `_resources/` contains student information and research guides.

Keep preview images square and compress them before adding them. Keep plots
readable and preserve the proportions of robots. The field photographs were
supplied from the November 2026 presentation; web versions are resized and
stripped of metadata. Mohamed's original portrait is kept alongside its square
web version and excluded from the generated site.

The profile template and example bibliography are editing aids, not public pages.

## Search and metadata

Canonical URLs use `https://rleaf.mathnum.inrae.fr` without a trailing slash in
`_config.yml`. Jekyll generates the sitemap. `robots.txt` allows public crawling;
`llms.txt` points compatible tools to the main content. Neither guarantees indexing
or citations. Structured data must describe the visible content accurately.

Use the `paper` fields only on a page for a specific paper with its complete
abstract. They add scholarly citation metadata and links to the available PDF. Each bibliography
entry can also define `doi`, `arxiv`, `publisher_url`, `hal` and `pdf` for direct
source links; `publications.bib` exports the maintained reference file.
Keep workshop papers, preprints and accepted publications clearly distinguished.

After deployment, check GitHub Pages **Enforce HTTPS**, submit the sitemap in
Search Console and inspect the main pages. The HTTPS setting is managed in
GitHub, outside this source tree.
