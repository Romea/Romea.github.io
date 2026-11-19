# R-LEAF

Robotics Laboratory for the Environment and Autonomous Farming, INRAE.

[Visit the website](https://rleaf.mathnum.inrae.fr)

## Local preview

Requires Ruby 3.4 and Bundler.

```sh
bundle install
bundle exec jekyll serve
```

Open http://localhost:4000.

## Content

- `_people/` and `_data/authors.yml`: team profiles.
- `_research/`: article pages and the automatic homepage selection.
- `_data/research_areas.yml`: research themes.
- `_data/projects.yml`: projects led by Johann.
- `_bibliography/references.bib`: bibliography, refreshed from HAL and Semantic Scholar at each
  build and every Monday. A member's papers are included by adding `semantic_scholar_id` (and
  optionally `hal_id`) in `_data/authors.yml`. Entries are never deleted automatically; to hide a
  wrong one, keep it and add `scope={hidden}`. Google Scholar has no API, so it is not a source.
- Photos can be added at any size: pages crop them, and the build compresses JPEGs and removes
  their metadata. Use `image_fit: contain` for a diagram that must stay complete.
- `_resources/`: student information and research guides.

Drafts in `_drafts/` are excluded from the site.

## Check before publishing

```sh
bundle exec ruby scripts/test_publications.rb
JEKYLL_ENV=production bundle exec jekyll build
python3 scripts/check_site.py
```

Built with Jekyll, Minimal Mistakes and Jekyll Scholar.
