#!/bin/bash

# Set the name of the directory to watch
dir_name=up_aries/bins
arch=$1
distro=$2
os=$3

# Get the list of modified files
modified_files=$(git diff-tree --no-commit-id --name-only -r HEAD)

# Check if the directory was modified
if echo "$modified_files" | grep -q "$dir_name"; then
    # Directory was modified, so push the changes
    git add up_aries/bins/aries-"${os}"-"${arch}"
    git config --global user.name "github actions"
    git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git commit -m "update aries binary for ${os}-${arch}"
    git pull --rebase
    git push
else
    # Directory was not modified, so do nothing
    echo "Directory $dir_name was not modified, skipping push."
fi
