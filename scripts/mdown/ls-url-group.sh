#!/bin/sh

# =================================================================
# DEFAULTS
# =================================================================
SEARCHSTR="xyzxyzxyz"
FILEPATH=""


# =================================================================
# PROCESS COMMANDLINE ARGUMENTS
# =================================================================
while getopts f:s: option
do
 case "${option}"
 in
 f) FILEPATH=${OPTARG};;
 s) SEARCHSTR=${OPTARG};;
 esac
done


# =================================================================
# LAUNCH URLS in GROUP
#   - use sed to extract a range of URLS delimited by a
#     header-line followed by the first 'empty-line'
#   - use awk, in turn, to extract the url from each markdown-style URL
#   - use appropriate browser to open each URL in it's own tab (all same window)
# =================================================================
sed -n "/$SEARCHSTR/,/^$/{/^$/q; p;}" $FILEPATH |
  while read line;
    do awk -F"[()]" '{ print $0 }';
  done
