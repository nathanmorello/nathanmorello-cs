#!/bin/bash

# 1. Switch to the main branch (the Hugo source branch)
git checkout main

# 2. (Optional) Pull latest changes
git pull origin main   # fetch and merge remote changes (skip if unnecessary)

# 3. Make your local edits
#    e.g. add new posts, change images, or update configuration

git add .

# 3a. Prompt user for commit message
read -p "Enter commit message (default: 'Update site content'): " commit_msg
commit_msg=${commit_msg:-"Update site content"}

git commit -m "$commit_msg"
git push origin main   # push your changes to the remote repository

# 4. Generate the static site from Hugo
hugo --cleanDestinationDir

# 5. Update the gh-pages branch with the static files
git push origin `git subtree split --prefix public main`:refs/heads/gh-pages --force

