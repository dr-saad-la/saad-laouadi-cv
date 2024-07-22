#!/bin/bash

set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project
hugo -d public

# Go to the public folder
cd public

# Initialize a new Git repository if it doesn't exist
if [ ! -d .git ]; then
  git init
  git remote add origin "https://github.com/dr-saad-la/saad-laouadi-cv.git"
  git checkout -b main
else
  git checkout main
fi

# Add changes to git
git add .

# Commit changes with a timestamp
msg="Deploy to GitHub Pages $(date)"
if [ -n "$*" ]; then
  msg="$*"
fi
git commit -m "$msg" || echo "Nothing to commit, working tree clean"

# Push to the gh-pages branch
git push --force "https://github.com/dr-saad-la/saad-laouadi-cv.git" main:gh-pages

# Come back to the project root
cd ..

rm -rf public
