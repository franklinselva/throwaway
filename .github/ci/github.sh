#!/bin/bash

arch=$1
os=$2

ls -l up_aries/bins/aries_"${os}"_"${arch}" || echo "no binary found" && exit 0
git add up_aries/bins/aries_"${os}"_"${arch}" || echo "no binary found" && exit 0
git config --global user.name "github actions"
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
git commit -m "update aries binary for ${os}-${arch}"
git pull --rebase
git push
