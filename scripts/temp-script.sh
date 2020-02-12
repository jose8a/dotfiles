#!/bin/sh

RANGE1=$1
RANGE2=$2
FILENAME=$3

# this script looks for an http url on each line and opens it using 'open' which
# opens the link with the default browser

# ASSUME: no mor than ONE http url on each line

sed -n '$RANGE1,$RANGE2 p' $FILENAME \
  | xargs -n 1 \
  | grep http \
  | xargs -n 1 open


