* [Potrace | Bitmap<=>SVG converter](http://potrace.sourceforge.net/)
* [Examples | Imagemagick Site](https://www.imagemagick.org/Usage/)

---
* create a canvas (background for compositing, layering, etc)

      $> convert -size 100x100 canvas:khaki  canvas_khaki.gif
      $> convert -size 100x100 xc:wheat  canvas_wheat.gif

* create a random-noise image

      $> convert -size 100x100 xc: +noise Random random.png

* create randomized plasma image (random every time run):

      $> convert -size 100x100  plasma:  plasma1.jpg

* create plasma images of other color-gradients

      $> convert -size 100x100 plasma:blue plasma_range1.jpg
      $> convert -size 100x100 plasma:black-black plasma_black.jpg
      $> convert -size 100x100 plasma:grey-grey plasma_grey.jpg
      $> convert -size 100x100 plasma:green-yellow plasma_range3.jpg
      $> convert -size 100x100 plasma:red-blue plasma_range4.jpg

* create a `fractal plasma` canvas image

      $> convert -size 100x100 plasma:fractal plasma_fractal1.jpg

* crop (`convert ... -crop ...`)

      $> convert image1.jpg -crop 128×128+50+50 image1_crop.jpg

* montage (`montage ... `)

      $> montage image1.jpg image2.jpg...imageN.jpg -geometry '300×200+20+20' imageAll_montage.jpg

* rotate image (`convert ... -rotate ...`)

      $> convert image.jpg -rotate 45 image_rotate45.jpg

* Flatten a transparent image with a white background (`convert ... -flatten ...`)

      $> convert -flatten img1.png img1-white.png

* Make an image transparent (`convert ... -transparent ...`)

      $> convert -transparent '#FFFFFF' nontransparent.gif transparent.png

* convert an image into tiles (`convert ... -size ...`)

      $> convert -size 3200x3200 tile:single_tile.png final.png

* making a montage from a collection of images (`montage ... -geometry ...`)

      $> montage -geometry +0+0 -background transparent *png montage.png

* inverting colors (`convert ... -negate ...`)

      $> convert before.png -negate after.png

* generating a favicon (`convert ... -resize ...`)

      $> convert large_image.png -resize 16x16! favicon.ico

* resize (keep aspect-ratio - fit only vert/hor edge INTO container size)

      $> convert dragon.gif -resize 64x64  resize_dragon.gif

* resize -- Ignore Aspect Ratio ('!' flag)

      $> convert dragon.gif -resize 64x64\! resize_dragon.gif

* resize -- Only Shrink Larger Images ('>' Only-Shrink-flag)

      $> convert dragon.gif -resize 64x64\> resize_dragon.gif

* resize image based on smallest fitting dimension --  ('^' Fill-Area-flag)

      $> convert dragon.gif -resize 64x64^ resize_dragon.gif

* Resize keep aspect ratio (`convert ... -resize ...`)

      $> convert input.jpg -resize 250x90 output.jpg

* Resize keep minimum image size (`convert ... -resize ...`)

      $> convert input.jpg -resize '250x90^' output.jpg

* Add a border to an image. -- Useful for creating bitmap masks in some cases (`convert ... -resize ...`)

      $> convert xc:white -resize 200x200\! -bordercolor black -border 2x2 PNG32:mask_200x200.png

* Resize an image -- Note that the ! indicates that the aspect ratio of the image can be changed. (`convert ... -resize ...`)

      $> convert -resize 50% icon@2x.png icon.png
      $> convert -resize 100x10\! icon.png stretched_icon.png

* Thumbnails - convert all images in folder and create in EXISTING subfolder 'thumbs' (`convert ... -thumbnail ...`) --OR--  (`mogrify ... -thumbnail ...`)

      $> mogrify -format gif -path thumbs -thumbnail 100x100 *.jpg

* [Imagemagick: Thumbnails and framing](https://www.imagemagick.org/Usage/thumbnails/#fit_summery)


* change-colors -- image negation

      $>  convert test.png -negate test_negate.png

* change-colors -- Level Adjustment by Color

      $> convert test.png +level-colors green,gold levelc_grn-gold.png
      $> convert test.png +level-colors ,DodgerBlue levelc_dodger.png
      $> convert test.png +level-colors Navy,  levelc_navy.png

* change-colors -- Image Tinting -- Uniform Color Tinting

      $> convert test.png -fill white -colorize 50% colorize_lighten.png
      $> convert test.png -fill black -colorize 50% colorize_darken.png
      $> convert test.png -fill gray50 -colorize 40% colorize_grayer.png

* change-colors -- Image Tinting -- Midtone Color Tinting

      $> convert test.png -fill red -tint 40 tint_red.png
      $>
      $>

* change-colors -- Image Tinting -- Sepia Tone Coloring (the 65% is variable to the exact `sepia-tone` you want to achieve)

      $> convert image.jpg -sepia-tone 65% sepia-tone.jpg

* `Artist charcoal-sketch of image` transform

      $> convert input-image.jpg -charcoal 5 charcoal.gif

* `Children's Color-In Outline Image` transform (normally-shaded pics)

      $> convert holocaust_sm.jpg \
          -edge 1 -negate -normalize \
          -colorspace Gray -blur 0x.5 -contrast-stretch 0x50% \
          color-in.gif

* `Children's Color-In Outline Image` transform (heavily-shaded pictures)

      $> convert holocaust_sm.jpg \
          -segment 1x1 +dither -colors 2 -edge 1 -negate -normalize \
          -colorspace Gray -blur 0x.5 -contrast-stretch 0x50% \
          color-in.gif

* `Children's Color-In Outline Image` transform (cartoon-like pictures) -- adjust `-threshold` to remove "noise-dots" created during transform

      $> convert piglet.gif -background white -flatten \
          -colorspace Gray -negate -edge 1 -negate -normalize \
          -threshold 50% -despeckle \
          -blur 0x.5 -contrast-stretch 0x50% \
          color-in_cartoon.gif

* `Pencil Sketch` transform (using `-sketch` operator)

      $> convert pagoda_sm.jpg -colorspace gray -sketch 0x20+120 sketch_new.gif

* `Pencil Sketch` transform (via raw imagemagick algorithm)

      $> convert -size 256x256 xc:  +noise Random  -virtual-pixel tile \
                        -motion-blur 0x20+135 -charcoal 1 -resize 50% pencil_tile.gif
      $> convert pagoda_sm.jpg -colorspace gray \
                        \( +clone -tile pencil_tile.gif -draw "color 0,0 reset" \
                        +clone +swap -compose color_dodge -composite \) \
                        -fx 'u*.2+v*.8' sketch.gif

* greyscale (convert command)

      $> convert test.png -colorspace Gray gray_colorspace.png

* stack photos as layers (composite command)


* generate histogram of image:

      $> convert image1.jpg histogram:image1_hist.gif

* histogram stretching (improve contrast) via `-normalize` operator

      $> convert image1.jpg  -normalize  image_normalized.jpg

* histogram stretching (improve contrast) via `-auto-level` operator

      $>  convert image1.jpg  -auto-level  image_leveled.jpg

*
