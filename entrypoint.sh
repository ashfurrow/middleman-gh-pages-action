#!/bin/bash

set -e

echo 'Installing bundles...'
cd ${INPUT_SITE_LOCATION}
gem install bundler
bundle install
bundle list | grep "middleman ("

echo 'Publishing site...'

# We use this instead: https://github.com/edgecase/middleman-gh-pages
bundle exec yaml:sort
bundle exec publish ALLOW_DIRTY=true

echo 'Done'
