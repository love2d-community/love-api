#!/bin/bash
set -ev
if [ "${TRAVIS_BRANCH}" = "master" ]; then
  git clone -b gh-pages --single-branch https://github.com/daviel/love-api pages
  git config --global user.email "travis@splashes"
  git config --global user.name "Travis Build Bot"

  cd pages/generator
  chmod +x update.sh
  sh update.sh
  cd ..
  git add index.html

  git commit -m "Update to ${TRAVIS_COMMIT}"

  git push -f -q https://daviel:$GITHUB_API_KEY@github.com/daviel/love-api gh-pages &2>/dev/null
fi
