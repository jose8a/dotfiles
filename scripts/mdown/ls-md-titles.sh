#!/bin/sh

# =================================================================
# DEFAULTS
# =================================================================
FILEPATH=""


# =================================================================
# PROCESS COMMANDLINE ARGUMENTS
# =================================================================
while getopts f: option
do
 case "${option}"
 in
 f) FILEPATH=${OPTARG};;
 esac
done


# =================================================================
# LAUNCH URLS in GROUP
#   - use sed to extract a range of URLS delimited by a
#     header-line followed by the first 'empty-line'
#   - use awk, in turn, to extract the url from each markdown-style URL
#   - use appropriate browser to open each URL in it's own tab (all same window)
# =================================================================
grep -i '##' $FILEPATH

# cat -n $FILEPATH | grep -i '##'

#sed -n "/$SEARCHSTR/,/^$/{/^$/q; p;}" $FILEPATH | while read line;
#  do awk -F"[()]" '{ print $2 }'; done | while read hline;
#  do $BROWSER $hline; done

