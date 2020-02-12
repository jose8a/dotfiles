#!/bin/bash
#
# desc: cli to blur an image using imagemagick
# required params:
#   * BLURAMT -- an amt of blur to apply to input image (range 1-??)
#   * INFILE -- an input image file
# optional params:
#   * OUTFILE -- a file to save the final blurred image
#
# notes:
#   * uses the imagemagick "convert" utility to blur an input image by a "BLURAMT"
#   * e.g blur_3
#         $> convert input_image.jpg -blur 0x3 output_image.jpg
#   * e.g. blur_10
#         $> convert input_image.jpg -blur 0x10 output_image.jpg

BLURAMT=$1
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
  echo "   - amt: a blur amt to add to image, valid values > 1"
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
  convert $INFILE -blur "0x"$BLURAMT $OUTFILE
else
  echo "ERROR: $INFILE does not exist"
fi

exit 0
* [ ] TODO: HISTCONTRAST1 ==> convert image1.jpg  -normalize  image_normalized.jpg
* [ ] TODO: HISTCONTRAST2 ==> convert image1.jpg  -auto-level  image_leveled.jpg
* [?] TODO: HISTOGRAM ==> convert image1.jpg histogram:image1_hist.gif
  // Thumbnails - convert all images in folder and create in EXISTING subfolder 'thumbs' (`convert ... -thumbnail ...`) --OR--  (`mogrify ... -thumbnail ...`)
* [ ] TODO: THUMBS ==> convert -format gif -path thumbs -thumbnail 100x100 *.jpg
* [ ] TODO: SEPIA ==> convert image.jpg -sepia-tone 65% sepia-tone.jpg
* [ ] TODO: GREYSCALE ==> convert test.png -colorspace Gray gray_colorspace.png
