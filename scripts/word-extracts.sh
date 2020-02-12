#!/bin/sh
# references:
#   * https://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/

FILENAME=$1

cat $FILENAME \
  | sed -n "s/[\/\.:()]/ /gp" \
  | tr '-' ' ' \
  | tr -d [:punct:] \
  | tr [:upper:] [:lower:] \
  | tr ' ' '\n' \
  | sed "/^$/D" \
  | sort \
  | uniq -c \
  | sort -r

# TODO: remove words with only numbers in them
# TODO: remove words less than 3 letters long
# TODO: remove common url snippets (http/s, com, org, en)
# TODO: remove article-words (a, an, the, ..)
# TODO: remove quantifier-words (many, few, none, ..)
# TODO:
