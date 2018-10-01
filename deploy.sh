#!/usr/bin/env bash

# This script rebuilds my Hugo site and commits
 # the changes inside of the /public folder. I have a
 # separate repository where the deployed site lives.

set -e # stop on error

DEPLOY_DIR=~/Projects/BLOG/gilbertek.github.io/
SOURCE_DIR=~/Projects/BLOG/leftaxe/

# Set the English locale for the `date` command.
 export LC_TIME=en_US.UTF-8

if [ ! -d "$DEPLOY_DIR" ]; then
  echo "\\033[0;32mDeploy directory '$DEPLOY_DIR' does not exist. Aborting.\\033[0m" >&2
  return 1
fi

echo "\\033[0;32m\\nGenerating site\\033[0m"
HUGO_ENV="production" hugo -d $DEPLOY_DIR

# Go To Public site folder
cd $DEPLOY_DIR

# Commit changes.
msg="Rebuilding portfolio site: $(date)"

git add --all

if [ $# -eq 1 ]
  then msg="$1"
fi

# Push source and build repos.
git commit -m "$msg"

echo "pushing site"
git push origin master
cd $SOURCE_DIR
echo "\\033[0;32mdeployed leftaxe to https://gilbertek.github.io \\033[0m"
