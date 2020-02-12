#!/bin/bash
#
# SKETCH_OUTLINE1:
#     convert input.jpg -edge 1 -negate -normalize -colorspace Gray -blur 0x.5 -contrast-stretch 0x50% color-in.gif
#
# desc:
#   `Children's Color-In Outline Image` transform (normally-shaded pics)
#
# required params:
#   * EDGEAMT -- an amt of line-weight to apply to input image (range 1-??)
#   * INFILE -- an input image file
#
# optional params:
#   * OUTFILE -- a file to save the final transformed image
#
# notes:
#   * uses the imagemagick "convert" utility to transform an input image by a "EDGEAMT"
#   * e.g outline_1
#         $> convert input.jpg -edge 1 -negate -normalize -colorspace Gray -blur 0x.5 \
#               -contrast-stretch 0x50% color-in.gif
#   * e.g. outline_3
#         $> convert input.jpg -edge 3 -negate -normalize -colorspace Gray -blur 0x.5 \
#               -contrast-stretch 0x50% color-in.gif

EDGEAMT=$1
INFILE=$2
OUTFILE=$3

# hard-code all non-EDGE options
# TODO: make these options more "flexible"? ==> TBD
DEFAULT_OPTS="-negate -normalize -colorspace Gray -blur 0x.5 -contrast-stretch 0x50%"

# extract the filetype extension from the filename
EXTENSION=`echo "$INFILE" | cut -d . -f 2`

# ensure that all three parameters are present
# TODO: ensure no more than 3 parameters ???
if [ "$#" -lt 3 ]
then
  echo "ERROR: Missing parameters"
  echo "Usage: $0 amt infile outfile"
  echo "   - edgeamt: an edge amt to add to image, valid values > 1"
  echo "   - infile: an input image file of type jpg, jpeg, gif, png"
  echo "   - outfile: a filename to save the output image"
  exit 0
fi

# check that image format is of type jpeg, jpg, gif or png
# TODO: convert $EXTENSION to lower case first???
if [ $EXTENSION != "jpeg" ] && [ $EXTENSION != "jpg" ] && [ $EXTENSION != "gif" ] && [ $EXTENSION != "png" ]
then
  echo "ERROR: Invalid filetype - not an image filetype"
  exit 0
fi

# make sure input file exists
# TOOD: check that output file doesn't already exist
if [ -s "$INFILE" ]
then
  convert $INFILE -edge $EDGEAMT $DEFAULT_OPTS $OUTFILE
else
  echo "ERROR: $INFILE does not exist"
fi

exit 0
