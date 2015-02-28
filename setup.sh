#!/bin/bash

# Only explore this folder level
# Only return "dotfiles"
find . -maxdepth 1 -name ".*" | while read fname; do
  regex="^\./(\.[a-zA-Z0-9_\.]+)$"

  if [[ $fname =~ $regex ]]; then
    name="${BASH_REMATCH[1]}"

    ln -fs $PWD/$name $HOME/$name
    echo symlinked:  $HOME/$name "-->" $PWD/$name
  fi
done

