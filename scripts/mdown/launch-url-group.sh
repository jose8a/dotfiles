#!/bin/sh

# =================================================================
# DEFAULTS
# =================================================================
BROWSER="opera"
SEARCHSTR="xyzxyzxyz"
FILEPATH=""

# =================================================================
# AVAILABLE BROWSERS
# =================================================================
# opera/vivaldi/firefox/chrome browser paths
opera="open -a /Applications/Opera.app/Contents/MacOS/Opera"
vivaldi="open -a /Applications/Vivaldi.app/Contents/MacOS/Vivaldi"
firefox="open -a /Applications/Firefox.app/Contents/MacOS/firefox"
chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


# =================================================================
# PROCESS COMMANDLINE ARGUMENTS
# =================================================================
while getopts b:f:s: option
do
 case "${option}"
 in
 b) VIEW=${OPTARG};;
 f) FILEPATH=${OPTARG};;
 s) SEARCHSTR=${OPTARG};;
 esac
done


case "$VIEW"
  in
  "c") BROWSER=$chrome;;
  "o") BROWSER=$opera;;
  "f") BROWSER=$firefox;;
  "v") BROWSER=$vivaldi;;
  *) echo "NOT a VALID BROWSER. Choose another!"
    exit -1;
    ;;
esac


# =================================================================
# LAUNCH URLS in GROUP
#   - use sed to extract a range of URLS delimited by a
#     header-line followed by the first 'empty-line'
#   - use awk, in turn, to extract the url from each markdown-style URL
#   - use appropriate browser to open each URL in it's own tab (all same window)
# =================================================================
sed -n "/$SEARCHSTR/,/^$/{/^$/q; p;}" $FILEPATH | while read line;
  do awk -F"[()]" '{ print $2 }'; done | while read hline;
  do $BROWSER $hline; done

