# ROMEA website

## Basic information
To modify and run locally the website, you need:
- Jekyll/bundler
- ruby 2.x (Warning: might be troublesome to install on recent linux distro)

Clone this repo, then 
`bundle exec jekyll serve --incremental`
to create a local instance of the website.

Once you are happy with the changes and the website compiles without errors, commit and push, github will deploy automatically.
*If you don't have the rights, push on another branch and create a PR*.

## Modify the website
- Posts are located in `_projects/`, `_research/`, `_jobs/` and `_people/` folders.
- Contact and 404 pages are located in `_pages/`. *You don't need to touch any other file in this folder*
- Images should be in `assets/images/`. Dont hesitate to create subfolders and keep things tidy.

### Add a reseach/project item
To add a project or a research page, simply add a file in the corresponding folder.
Don't forget to add a teaser image.

### Create a new people page
1) Fill a new entry in `_data/authors/yml`.
2) [Optionnal] add a bibliography (`.bib`file) in `_bibliography/`.
3) Create a new file in `_people/`.

### Change the projects on the main page
TODO

### Handling citations
The website uses [Jekyll-scholar](https://github.com/inukshuk/jekyll-scholar).

