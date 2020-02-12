#################################################################
# ScriptName: extract-links.sed
# Description:
#   * script takes in a Chrome-exported Bookmarks file and
#       generates Markdown-formatted output
#
# Details:
#   * script strips out all non-H3 or HREF content
#   * script extracts section-titles, link-urls, and link-titles and
#       generates a Markdown-formated output
#
# Usage:
#   $> sed -nf extract-links.sed < INPUTFILE
#
#
#################################################################


/H3/ s/.*<DT><H3 >\([a-zA-Z]*\)<\/H3>/### \1/p
/HREF/ s/.*\(http[^"]*\).*>\(.*\)<\/A>/\* [\1](\2)/p
