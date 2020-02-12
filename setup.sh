#!/bin/bash

# Only explore this folder level
# Only return "dotfiles"
find . -maxdepth 1 -name ".*" | while read fname; do
  regex="^\./(\.[a-zA-Z0-9_\.]+)$"

  if [[ $fname =~ $regex ]]; then
    name="${BASH_REMATCH[1]}"

    rm -v $HOME/$name

    ln -fs $PWD/$name $HOME/$name
    echo symlinked:  $HOME/$name "-->" $PWD/$name
  fi
done

# TODO: handle the .vimconfig directory as well
#   - `rmdir $HOME/.vimconfig`
#   - `ls -s ...etc`

# create dynamic file to store the latest location of dotfiles folder
# needs to be recreated every time the DOTFILES/setup.h is run in
# case location of dotfiles local repo changes
echo 'export DOTFILES='`pwd` >> $HOME/.dotfiles_temp

# RE-source bashrc and can now check if new setup is proper
source ~/.bashrc
