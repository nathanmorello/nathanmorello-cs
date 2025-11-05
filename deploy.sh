#!/bin/bash

# 1. Switch to the main branch (the Hugo source branch)
git checkout main

# 2. (Optional) If you also work on other computers:
git pull origin main   # fetch and merge remote changes (skip if unnecessary)

# 3. Make your local edits
#    e.g. add new posts, change images, or update configuration

git add .
git commit -m "Update site content"
git push origin main   # push your changes to the remote repository

# 4. Generate the static site from Hugo
hugo

# 5. Update the gh-pages branch with the static files
git push origin `git subtree split --prefix public main`:refs/heads/gh-pages --force

