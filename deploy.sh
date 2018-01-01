#!/usr/bin/env bash

# This script rebuilds my Hugo site and commits
# the changes inside of the /public folder. I have a
# separate repository where the deployed site lives.

# Set the English locale for the `date` command.
export LC_TIME=en_US.UTF-8

echo -e "\\033[0;32mDeploying updates to GitHub...\\033[0m"

if [[ $(git status -s) ]]; then
  echo "The working directory is dirty, please commit or stash any pending changes"
  exit 1;
fi

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
(cd public || exit)

# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding portfolio site: $(date)"

if [ $# -eq 1 ]
  then msg="$1"
fi

# Push source and build repos.
git commit -m "$msg"

git push origin master
(cd .. || exit)
