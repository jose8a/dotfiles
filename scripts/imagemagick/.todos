---
* below are ONLY listed the options -- the full command is format as follows:
      $> convert input_image.jpg $OPTIONS output_image.jpg

* e.g. --> the `shade_10` effect would be called as follows:

      $> convert image.jpg -blur 0x10 -fx G -shade 120x45 image_shade10.jpg

---
* [ ] TODO:  ==>
* [ ] TODO: HISTCONTRAST1 ==> convert image1.jpg  -normalize  image_normalized.jpg
* [ ] TODO: HISTCONTRAST2 ==> convert image1.jpg  -auto-level  image_leveled.jpg
* [?] TODO: HISTOGRAM ==> convert image1.jpg histogram:image1_hist.gif
  // Thumbnails - convert all images in folder and create in EXISTING subfolder 'thumbs' (`convert ... -thumbnail ...`) --OR--  (`mogrify ... -thumbnail ...`)
* [ ] TODO: THUMBS ==> convert -format gif -path thumbs -thumbnail 100x100 *.jpg
* [ ] TODO: SEPIA ==> convert image.jpg -sepia-tone 65% sepia-tone.jpg
* [ ] TODO: GREYSCALE ==> convert test.png -colorspace Gray gray_colorspace.png
* [ ] TODO: SKETCH_CHARCOAL ==> convert input-image.jpg -charcoal 5 charcoal.gif
* [ ] TODO: SKETCH_CHARCOAL2 ==> convert input_image.jpg -blur 0x2 -charcoal 10 -negate output_image.jpg
  // `Children's Color-In Outline Image` transform (normally-shaded pics)
* [ ] TODO: SKETCH_OUTLINE1 ==> convert holocaust_sm.jpg \
                            -edge 1 -negate -normalize \
                            -colorspace Gray -blur 0x.5 -contrast-stretch 0x50% \
                            color-in.gif
  // `Children's Color-In Outline Image` transform (heavily-shaded pictures)
* [ ] TODO: SKETCH_OUTLINE2 ==> convert holocaust_sm.jpg \
                            -segment 1x1 +dither -colors 2 -edge 1 -negate -normalize \
                            -colorspace Gray -blur 0x.5 -contrast-stretch 0x50% \
                            color-in.gif
  // `Children's Color-In Outline Image` transform (cartoon-like pictures) -- adjust `-threshold` to remove "noise-dots" created during transform
* [ ] TODO: SKETCH_OUTLINE3 ==> convert piglet.gif -background white -flatten \
                            -colorspace Gray -negate -edge 1 -negate -normalize \
                            -threshold 50% -despeckle \
                            -blur 0x.5 -contrast-stretch 0x50% \
                            color-in_cartoon.gif
  // `Pencil Sketch` transform (using `-sketch` operator)
* [ ] TODO: SKETCH_PENCIL1 ==> convert pagoda_sm.jpg -colorspace gray -sketch 0x20+120 sketch_new.gif
  // `Pencil Sketch` transform (via raw imagemagick algorithm)
* [ ] TODO: SKETCH_PENCIL2 ==> convert -size 256x256 xc:  +noise Random  -virtual-pixel tile \
                            -motion-blur 0x20+135 -charcoal 1 -resize 50% pencil_tile.gif
                        convert pagoda_sm.jpg -colorspace gray \
                            \( +clone -tile pencil_tile.gif -draw "color 0,0 reset" \
                            +clone +swap -compose color_dodge -composite \) \
                            -fx 'u*.2+v*.8' sketch.gif
* [ ] TODO: COMPOSITE ==> TBD
* [ ] TODO: CROP ==> convert image1.jpg -crop 128×128+50+50 image1_crop.jpg
* [ ] TODO: RESIZE1 ==> convert dragon.gif -resize 64x64  resize_dragon.gif
  // resize2 -- Ignore Aspect Ratio ('!' flag)
* [ ] TODO: RESIZE2 ==> convert dragon.gif -resize 64x64\! resize_dragon.gif
  // resize3 -- Only Shrink Larger Images ('>' Only-Shrink-flag)
* [ ] TODO: RESIZE3 ==> convert dragon.gif -resize 64x64\> resize_dragon.gif
  // resize4 image based on smallest fitting dimension --  ('^' Fill-Area-flag)
* [ ] TODO: RESIZE4 ==> convert dragon.gif -resize 64x64^ resize_dragon.gif
  // Resize5 keep aspect ratio (`convert ... -resize ...`)
* [ ] TODO: RESIZE5 ==> convert input.jpg -resize 250x90 output.jpg
  // Resize6 keep minimum image size (`convert ... -resize ...`)
* [ ] TODO: RESIZE6 ==> convert input.jpg -resize '250x90^' output.jpg
* [ ] TODO: MONTAGE ==> montage image1.jpg image2.jpg...imageN.jpg -geometry '300×200+20+20' imageAll_montage.jpg
* [ ] TODO: MONTAGE2 ==> montage -geometry +0+0 -background transparent *png montage.png
* [ ] TODO: ROTATE ==> convert image.jpg -rotate 45 image_rotate45.jpg
* [ ] TODO: INVERT ==> convert before.png -negate after.png
* [ ] TODO: FAVICON ==> convert large_image.png -resize 16x16! favicon.ico
* [X] TODO: BLUR ==> convert input_image.jpg -blur 0x1 output_image.jpg
* [ ] TODO: SHADE ==> convert input_image.jpg -shade 120x45 output_image.jpg
* [ ] TODO: EMBOSS ==> convert input_image.jpg -emboss 1 output_image.jpg
* [ ] TODO: EDGES ==> convert input_image.jpg -blur 0x2  -edge 10 output_image.jpg
* [ ] TODO: MESAS ==> convert input_image.jpg -blur 0x2  -edge 10 -fx G -shade 120x45 output_image.jpg
* [ ] TODO: LINES ==> convert input_image.jpg -blur 0x10 -emboss 4 -edge 1 output_image.jpg
* [ ] TODO: LOOPS ==> convert input_image.jpg -blur 0x10 -edge 15  -edge 1  -blur 0x1 output_image.jpg
* [ ] TODO: RIDGES ==> convert input_image.jpg -blur 0x10 \( +clone -negate \) -edge 1 -fx u.G+v.G -shade 280x45 output_image.jpg
* [ ] TODO: PAINT ==> convert input_image.jpg -paint 10 output_image.jpg
* [ ] TODO: CANVAS ==> convert -size 100x100 canvas:khaki  canvas_khaki.gif
* [ ] TODO: RANDNOISE ==> convert -size 100x100 xc: +noise Random random.png
  // resize1 (keep aspect-ratio - fit only vert/hor edge INTO container size)
* [ ] TODO: TINTALL_LIGHTEN ==> convert test.png -fill white -colorize 50% colorize_lighten.png
* [ ] TODO: TINTALL_DARKEN ==> convert test.png -fill black -colorize 50% colorize_darken.png
* [ ] TODO: TINTALL_GRAYER ==> convert test.png -fill gray50 -colorize 40% colorize_grayer.png
* [ ] TODO: TINTMID ==> convert test.png -fill red -tint 40 tint_red.png
