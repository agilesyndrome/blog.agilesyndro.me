#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf docs
hugo

git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
wtc "$msg"

# Push source and build repos.
git push origin master

