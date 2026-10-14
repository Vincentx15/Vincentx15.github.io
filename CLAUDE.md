# Vincent Mallet's personal website

Jekyll site (AcademicPages / Minimal Mistakes theme) deployed by GitHub Pages from `master` at https://vincentx15.github.io.
Pushing to `master` publishes the site: commit locally and let Vincent push, unless he says otherwise.

## Where content lives

| Page | URL | Source | Data |
|---|---|---|---|
| Home / about | `/` | `_pages/about.md` (free text, research figure `files/research_one_slide.svg`) | – |
| Publications | `/publications/` | `_pages/publications.md` + `_includes/publication.html` + `assets/js/pub-filter.js` | `_data/publications.yml`, `_data/publication_types.yml` |
| Teaching | `/teaching/` | `_pages/teaching.md` | `_data/cv.yml` → `teaching` |
| Students | `/students/` | `_pages/students.md` (applicant text is free text) | `_data/cv.yml` → `students.{postdoc,phd,joint,alumni}` |
| CV | `/cv/` | `_pages/cv.md` | `_data/cv.yml` → `positions, education, awards, service, talks` |

- Top menu: `_data/navigation.yml`. Sidebar (photo `images/pp.png`, bio, links): `author:` block of `_config.yml`.
- PDFs: `files/CV.pdf` (the reference for all content), `files/PhD_vf.pdf`.
- Styles specific to this site: `_sass/_custom.scss` (imported last in `assets/css/main.scss`). Everything else in `_sass/`, `_layouts/`, `_includes/` is theme code; avoid editing it.

## Updating content

The source of truth is `files/CV.pdf` (read it with `pdftotext -layout files/CV.pdf -`). When Vincent updates the CV, diff its sections against the yml files:

- New paper: add an entry to `_data/publications.yml` with its `section` (journal, conference, workshop, preprint). The page groups entries by `year` under year headings, gives each a colored type badge and a filter bar (linkable as `/publications/#journal`); within a year the file order is kept. A new type needs a label in `_data/publication_types.yml` and a color in `$pub-types` in `_sass/_custom.scss`. Fields: `title, authors, venue, year, section, links`. Write `*` after a name for equal contribution; `Vincent Mallet` is bolded automatically. Link names in use: `paper, preprint, code, docs, pip`. When a preprint gets published, move it to its new section and add the `paper` link, keeping the `preprint` link.
- Talks, teaching, students, awards, positions: add items to `_data/cv.yml` (`date`, `title`, optional `detail` and `url`; markdown allowed in title and detail). Date style: `2024 – 2026` (en dash) or `since 2025`.
- Students: when someone finishes, move them to `students.alumni` with an end date.
- Text on the home page is Vincent's own writing: keep edits factual and minimal (see his writing-style skill: no em-dashes, no filler).
- Spelling conventions: "Mines Paris - PSL", "École Polytechnique", "Jérôme Waldispühl".

## Checking links

Publisher sites (OUP, ACS via doi.org) return 403 to scripts and LinkedIn returns 999: this is normal. Check a DOI with `curl -s https://doi.org/api/handles/<doi>` (responseCode 1 means it resolves).
`rnaglib.cs.mcgill.ca` and `rnamigos.cs.mcgill.ca` were down in Oct. 2026 and were replaced by the GitHub repo and `rnaglib.readthedocs.io`.

## Building locally

`./serve.sh` builds and serves the site at http://localhost:4000 with live reload (extra args go to `jekyll serve`).
On first run it creates a conda env in `~/.cache/vincentx15-site` (Ruby 3.3 + compilers, then the gems), because the system Ruby has no dev headers and a plain `bundle install` fails.
It works on a copy of the Gemfile in that folder, so no `Gemfile.lock` lands in the repo, and uses the bundler shipped with the conda Ruby.

To check pages visually, screenshot the running server:
`google-chrome --headless=new --no-sandbox --virtual-time-budget=5000 --window-size=1300,1800 --screenshot=out.png http://localhost:4000/publications/` (width 390 for mobile).

## Leftovers to know about

- `_config.yml` still carries unused theme options (comments, staticman, social): harmless.
- `files/research_one_slide.svg` is 5.9 MB; `files/research_one_slide.png` (untracked) is only 958 px wide, so the SVG is kept for sharpness.
