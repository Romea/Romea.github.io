# ROMEA website

## Basic information
To modify and run locally the website, you need:
- Jekyll/bundler
- ruby 2.x (Warning: might be troublesome to install on recent linux distro)

**If you only need to modify an existing page, you can do it online and avoid all the tedious aspects of running the website on local. Just use the github editor!**

Clone this repo, then 
`bundle exec jekyll serve --incremental`
to create a local instance of the website.

Once you are happy with the changes and the website compiles without errors, commit and push, github will deploy automatically.
*If you don't have the rights, push on another branch and create a PR*.

## Modify the website
- Posts are located in `_research/` and `_people/` folders.
- Contact and 404 pages are located in `_pages/`. *You don't need to touch any other file in this folder*
- Images should be in `assets/images/`. Dont hesitate to create subfolders and keep things tidy.

### Modify the main page
- All the information is in `index.md`
- To change one of the featured post, modify the `feature_row` object. Don't forget to also modify the url. 

### Add a reseach item
To add a research page, simply add a file in the corresponding folder.
Don't forget to update the teaser image.

### Create a new people page
1) Fill a new entry in `_data/authors/yml`.
2) [Optionnal] add a bibliography (`.bib`file) in `_bibliography/`.
3) Create a new file in `_people/`.

### Handling citations
The website uses [Jekyll-scholar](https://github.com/inukshuk/jekyll-scholar).

## Advanced editing
- For a small css change, you can add your style at the end of `assets/css/main.scss`. It will override the basic style.
- To modify the layouts of the pages, add or modify the files in `_layout/`. As we are using a remote theme, if a file is missing, you need to copy it from the remote theme and then modify. It should override the file of the remote theme.
- The website is built using [Minimal-Mistakes](https://mmistakes.github.io/minimal-mistakes/). See the [doc](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/) for any other modification.
