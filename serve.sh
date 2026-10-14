#!/bin/bash
# Preview the site at http://localhost:4000, rebuilding on every save.
# The first run installs Ruby and the gems in a conda env (~5 min); later runs start in seconds.
# The system Ruby has no dev headers, which is why a plain `bundle install` fails.
set -e

ENV_DIR="${SITE_ENV:-$HOME/.cache/vincentx15-site}"
CONDA="$(command -v conda || echo "$HOME/miniconda3/bin/conda")"
REPO="$(cd "$(dirname "$0")" && pwd)"

if [ ! -x "$ENV_DIR/ruby/bin/ruby" ]; then
  "$CONDA" create -y -p "$ENV_DIR/ruby" -c conda-forge ruby=3.3 compilers make pkg-config
fi

export PATH="$ENV_DIR/ruby/bin:$PATH"
export BUNDLE_GEMFILE="$ENV_DIR/Gemfile" BUNDLE_PATH="$ENV_DIR/bundle" BUNDLE_APP_CONFIG="$ENV_DIR/.bundle"
BUNDLE="$ENV_DIR/ruby/bin/bundle"  # bundler shipped with the conda Ruby

# Work on a copy of the Gemfile so that Gemfile.lock stays out of the repo
cmp -s "$REPO/Gemfile" "$BUNDLE_GEMFILE" || cp "$REPO/Gemfile" "$BUNDLE_GEMFILE"
$BUNDLE check > /dev/null 2>&1 || $BUNDLE install

cd "$REPO"
$BUNDLE exec jekyll serve --config _config.yml,_config.dev.yml --livereload "$@"
