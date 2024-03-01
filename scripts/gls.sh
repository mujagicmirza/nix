#!/usr/bin/env bash

# Check if git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "Not a git repo"
  exit 1
fi

# Get files in current dir
files=$(ls)

# Loop through files
for file in $files
do
  gitinfo=$(git --no-pager log --no-merges -n 1 --pretty=format:"%an - %s%n" -- $file)

  # Define color codes
  brighter_color='\033[1;34m'  # ANSI color code for a brighter color
  reset_color='\033[0m'        # ANSI color code to reset color

  # Print filename and gitinfo with a brighter color
  printf "%s - ${brighter_color}%s${reset_color}\n" "$file" "$gitinfo"

done
