#!/bin/bash

# -----------------------------------------------------
# -- this script creates a simple and crude MARKDOWN file from
# --   a JADE file.
# --
# -- It only searches for links and section titles. Everything
# --   else will be ignored and discarded.
# -----------------------------------------------------
ls -1 | while read line; do
  if [[ $line == *.jade ]]; then
    echo "MATCHES: $line"
    OUTFILE="$line.MD"
    touch $OUTFILE

    sed -nE -e "s/^.*tab.*#(.*)$/### \1/p" \                # find section headers (usualy contain 'tab' phrase)
      -e "s/^.*li.*\'(.*)\'\)\s?(.*)$/  * [\2](\1)/p" \     # find links
      -e $'s/^$/\\\n\\\n/p' $line >> $OUTFILE               # find blank lines
  else
    echo "NO MATCH: $line"
  fi
done

