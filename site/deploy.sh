#!/bin/bash

set -e

# Build the project
hugo -d public

# Go to the public folder and create a new git repo
cd public
git init
git add .
git commit -m "Deploy to GitHub Pages"

# Force push to the gh-pages branch
git push --force "https://github.com/dr-saad-la/SaadCV.git" main:gh-pages

cd ..
rm -rf public
