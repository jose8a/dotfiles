#!/bin/bash
#
# SKETCH_OUTLINE3:
#     convert input.gif -background white -flatten -colorspace Gray -negate -edge 1 -negate -normalize \
#         -threshold 50% -despeckle -blur 0x.5 -contrast-stretch 0x50% output_cartoon.gif
#
# desc:
#   * `Children's Color-In Outline Image` transform (cartoon-like pictures)
#   * adjust `-threshold` to remove "noise-dots" created during transform
#
# required params:
#   * EDGEAMT -- a line-edge amount to apply to the input image (range 1-??)
#   * THRESHOLD -- adjust (0-100, default=50) to remove "noise-dots" created during transform
#   * INFILE -- an input image file
#
# optional params:
#   * OUTFILE -- a file to save the final transformed image
#
# notes:
#   * uses the imagemagick "convert" utility to transform an input image by an "EDGEAMT"
#   * e.g outline_1
#         $> convert input.gif -background white -flatten -colorspace Gray -negate -edge 1 -negate -normalize \
#               -threshold 50% -despeckle -blur 0x.5 -contrast-stretch 0x50% output_cartoon.gif
#   * e.g. outline_3
#         $> convert input.gif -background white -flatten -colorspace Gray -negate -edge 1 -negate -normalize \
#               -threshold 50% -despeckle -blur 0x.5 -contrast-stretch 0x50% output_cartoon.gif

EDGEAMT=$1
THRESHOLD=$2
INFILE=$3
OUTFILE=$4

# hard-code all non-EDGE options
# TODO: make these options more "flexible"? ==> TBD
OPTS1="-background white -flatten -colorspace Gray -negate"
OPTS2="-negate -normalize"
OPTS3="-despeckle -blur 0x.5 -contrast-stretch 0x50%"

# extract the filetype extension from the filename
EXTENSION=`echo "$INFILE" | cut -d . -f 2`

# ensure that all three parameters are present
# TODO: ensure no more than 3 parameters ???
if [ "$#" -lt 4 ]
then
  echo "ERROR: Missing parameters"
  echo "Usage: $0 edgeamt threshold infile outfile"
  echo "   - edgeamt: a line-edge amount to add to image, valid values > 1"
  echo "   - threshold: adjust this to remove 'noise-dots' in output"
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
  convert $INFILE $OPTS1 -edge $EDGEAMT $OPTS2 -threshold $THRESHOLD"%" $OPTS3 $OUTFILE
else
  echo "ERROR: $INFILE does not exist"
fi

exit 0
