#!/bin/bash
#
# SKETCH_CHARCOAL1:
#     $> convert input-image.jpg -charcoal 5 charcoal.gif
#
# desc: cli to transform an image to "charcoal sketch" using imagemagick
# required params:
#   * AMT -- a transformation amount to apply to input image (range 1-??)
#   * INFILE -- an input image file
# optional params:
#   * OUTFILE -- a file to save the transformed final image
#
# notes:
#   * uses the imagemagick "convert" utility to transform an input image by a "AMT"
#   * e.g charcoal_3
#         $> convert input_image.jpg -charcoal 3 output_image.jpg
#   * e.g. charcoal_10
#         $> convert input_image.jpg -charcoal 10 output_image.jpg

AMT=$1
INFILE=$2
OUTFILE=$3

# extract the filetype extension from the filename
EXTENSION=`echo "$INFILE" | cut -d . -f 2`

# ensure that all three parameters are present
# TODO: ensure no more than 3 parameters ???
if [ "$#" -lt 3 ]
then
  echo "ERROR: Missing parameters"
  echo "Usage: $0 amt infile outfile"
  echo "   - amt: a transformation amt to add to image, valid values > 1"
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
  convert $INFILE -charcoal $AMT $OUTFILE
else
  echo "ERROR: $INFILE does not exist"
fi

exit 0

