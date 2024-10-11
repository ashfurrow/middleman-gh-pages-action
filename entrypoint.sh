#!/bin/bash

set -e

echo 'Installing bundles...'
cd ${INPUT_SITE_LOCATION}
gem install bundler
bundle install
bundle list | grep "middleman ("

echo 'Publishing site...'

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

# We use this instead: https://github.com/edgecase/middleman-gh-pages
bundle exec rake yaml:sort
bundle exec publish ALLOW_DIRTY=true

echo 'Done'
