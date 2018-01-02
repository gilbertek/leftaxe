#!/usr/bin/env bash

# This script rebuilds my Hugo site and commits
 # the changes inside of the /public folder. I have a
 # separate repository where the deployed site lives.

set -e # stop on error

BLOG_DIR="../gilbertek.github.io"

# Set the English locale for the `date` command.
 export LC_TIME=en_US.UTF-8

if [[ $(git status -s) ]]
then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi


echo "Generating site"
HUGO_ENV="production" hugo -d $BLOG_DIR

# Go To Public site folder
(cd $BLOG_DIR || exit)

# Commit changes.
msg="Rebuilding portfolio site: $(date)"

if [ $# -eq 1 ]
  then msg="$1"
fi

# Push source and build repos.
git commit -m "$msg"

echo "pushing site"
git push origin master
(cd .. || exit)
