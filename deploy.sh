#!/usr/bin/env bash

# This script rebuilds my Hugo site and commits
# the changes inside of the /public folder. I have a
# separate repository where the deployed site lives.

echo -e "\\033[0;32mDeploying updates to GitHub...\\033[0m"
hugo

cd public
git add .

msg="Rebuilding portfolio: `date`"

if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"
git push origin master
cd ..
