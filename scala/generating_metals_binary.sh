#!/bin/bash

# TAGS in https://github.com/scalameta/metals
# https://scalameta.org/metals/docs/editors/vim.html

COURSIER=~/bin/coursier
METALS_VIM=~/bin/metals-vim
METALS_VIM_VERSION=0.7.6

echo "Getting coursier..."
curl -L -o ${COURSIER} https://git.io/coursier

echo "Changing executable flag..."
chmod +x ${COURSIER}

echo "Building ${METALS_VIM}..."
${COURSIER} bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:${METALS_VIM_VERSION} \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o ${METALS_VIM} -f

echo "Done $(ls -l ${METALS_VIM})..."
