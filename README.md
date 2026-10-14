Personal website of Vincent Mallet, served by GitHub Pages at https://vincentx15.github.io.

Built with Jekyll on the [AcademicPages](https://github.com/academicpages/academicpages.github.io) template (a fork of [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/), MIT License, see LICENSE).

Content is mostly data-driven: publications are in `_data/publications.yml`, positions, awards, talks, teaching and students in `_data/cv.yml`. See `CLAUDE.md` for the layout of the repository.

To preview locally, run `./serve.sh` and open http://localhost:4000. Pages rebuild and the browser reloads on every save.
The first run installs Ruby and the gems in a conda env under `~/.cache/vincentx15-site` (about 5 minutes).
Do not run `bundle install` directly: the system Ruby has no dev headers, so the native gems fail to compile.
