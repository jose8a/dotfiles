!#/bin/sh

#################################################################
# ScriptName: open-mdlinks.sh:
# Description:
#   * reads in a Markdown file with links
#   * uses sed to extract any/all links in the file
#   * script launches any/all links in the Markdown file
#
# Notes:
#   * script expects one link per line in the MD file
#   * if more than one link per line, behaviour not tested, but
#       it likely means the 2nd++ links won't be found and opened
#
#################################################################

MDFILE="$1"
echo "Input file is: " $MDFILE

for URL in $(sed -n 's/.*\[\(http.*\)\].*/\1/p' $MDFILE)
do
  echo "opening ... " $URL
  open $URL
done
