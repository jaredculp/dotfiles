#!/bin/bash

# installs vim packages using vim8 built in package support
# see: http://vim-jp.org/vimdoc-en/repeat.html#packages

packages_home="$HOME/.vim/pack/plugins/start"
mkdir -p "$packages_home"

# Install or update the given vim package.
#
# Usage: add_package <github_user> <repo_name>
add_package() {
  package_dir="$packages_home/$2"
  if [ ! -d "$package_dir" ]; then
    git clone "https://github.com/$1/$2" "$package_dir"
  else
    (cd "$package_dir" && git pull origin master)
  fi
}

add_package romainl Apprentice
add_package tpope vim-fugitive
