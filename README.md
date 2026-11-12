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
- `_research/` and `_data/research_areas.yml`: research pages and overview.
- `_data/projects.yml`: projects led by Johann.
- `_bibliography/references.bib`: publications.
- `_data/home_publications.yml`: three published papers featured on the homepage.
- `_resources/`: student information and research guides.

Drafts in `_drafts/` are excluded from the site.

## Check before publishing

```sh
JEKYLL_ENV=production bundle exec jekyll build
python3 scripts/check_site.py
```

Built with Jekyll, Minimal Mistakes and Jekyll Scholar.
