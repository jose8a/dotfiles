---
* below are ONLY listed the options -- the full command is format as follows:
      $> convert input_image.jpg $OPTIONS output_image.jpg

* e.g. --> the `shade_10` effect would be called as follows:

      $> convert image.jpg -blur 0x10 -fx G -shade 120x45 image_shade10.jpg

---
* blur_1
      $> convert input_image.jpg -blur 0x1 output_image.jpg

* blur_3
      $> convert input_image.jpg -blur 0x3 output_image.jpg

* blur_10
      $> convert input_image.jpg -blur 0x10 output_image.jpg

* channel
      $> convert input_image.jpg -blur 0x10  -fx G output_image.jpg

* shade
      $> convert input_image.jpg -shade 120x45 output_image.jpg

* shade_dimmed (no post -auto-level)
      $> convert input_image.jpg -shade 120x45 -auto-level -fill grey -colorize 40% output_image.jpg

* shade_1
      $> convert input_image.jpg -blur 0x1 -shade 120x45 output_image.jpg

* shade_5
      $> convert input_image.jpg -blur 0x5 -shade 120x45 output_image.jpg

* shade_10
      $> convert input_image.jpg -blur 0x10 -fx G -shade 120x45 output_image.jpg

* emboss_1
      $> convert input_image.jpg -blur 0x5  -emboss 1 output_image.jpg

* emboss_1g
      $> convert input_image.jpg -blur 0x5  -emboss 1  -fx G output_image.jpg

* emboss_0s
      $> convert input_image.jpg -blur 0x3  -emboss .5 -shade 120x45 output_image.jpg

* emboss_1s
      $> convert input_image.jpg -blur 0x5  -emboss 1  -shade 120x45 output_image.jpg

* emboss_1gs
      $> convert input_image.jpg -blur 0x5  -emboss 1  -fx G  -shade 120x45 output_image.jpg

* emboss_5gs
      $> convert input_image.jpg -blur 0x10 -emboss 5  -fx G  -shade 120x45 output_image.jpg

* charcoal
      $> convert input_image.jpg -blur 0x2  -charcoal 10 -negate output_image.jpg

* charcoal_10s
      $> convert input_image.jpg -blur 0x2  -charcoal 10 -negate -shade 120x45 output_image.jpg

      $> convert input_image.jpg -blur 0x2  -charcoal 1  -negate -shade 120x45 output_image.jpg

* edges
      $> convert input_image.jpg -blur 0x2  -edge 10 output_image.jpg

* edge_grey
      $> convert input_image.jpg -blur 0x2  -edge 10 -fx G output_image.jpg

* mesas
      $> convert input_image.jpg -blur 0x2  -edge 10 -fx G -shade 120x45 output_image.jpg

* lines
      $> convert input_image.jpg -blur 0x10 -emboss 4 -edge 1 output_image.jpg

* loops
      $> convert input_image.jpg -blur 0x10 -edge 15  -edge 1  -blur 0x1 output_image.jpg

* engrave_loops
      $> convert input_image.jpg -blur 0x10 -edge 15  -edge 1  -blur 0x1 -fx R+B+G -shade 280x45 output_image.jpg

* engrave_loop
      $> convert input_image.jpg -blur 0x10 -edge 15  -edge 1  -blur 0x1 -fx G -shade 280x45 output_image.jpg

* color_contours
      $> convert input_image.jpg -blur 0x10 -normalize -fx 'sin(u*4*pi)*100' -edge 1 -blur 0x1 output_image.jpg

* contours
      $> convert input_image.jpg -blur 0x10 -normalize -fx 'sin(g*4*pi)*100' \
                        -edge 1 -blur 0x1 -shade 280x45 output_image.jpg

* blobs
      $> convert input_image.jpg -blur 0x10 -edge 1 output_image.jpg

* blobs_grey
      $> convert input_image.jpg -blur 0x10 -edge 1 -fx '(R+G+B)/3' output_image.jpg

* pits
      $> convert input_image.jpg -blur 0x10 -edge 1 -fx G -shade 280x45 output_image.jpg

* ridges
      $> convert input_image.jpg -blur 0x10 \( +clone -negate \) -edge 1 -fx u.G+v.G -shade 280x45 output_image.jpg

* paint_raw10 (no post -auto-level)
      $> convert input_image.jpg -paint 10 output_image.jpg

* paint_areas
      $> convert input_image.jpg -paint 10  -blur 0x5  -paint 10 output_image.jpg

* paint_raw10s
      $> convert input_image.jpg -paint 10  -shade 120x45 output_image.jpg

* paint_8
      $> convert input_image.jpg -blur 0x5  -paint 8 output_image.jpg

* paint_8s
      $> convert input_image.jpg -blur 0x5  -paint 8  -shade 120x45 output_image.jpg

* paint_3
      $> convert input_image.jpg -blur 0x10 -paint 3 output_image.jpg

* paint_3s
      $> convert input_image.jpg -blur 0x10 -paint 3  -shade 120x45 output_image.jpg

* paint_3d
      $> convert input_image.jpg -blur 0x10 -paint 3 \( +clone -shade 120x45 \) \
     +swap  -compose overlay -composite output_image.jpg

* zebra
      $> convert input_image.jpg -blur 0x12 -normalize \
     -size 1x19   pattern:gray50   -fx 'v.p{0,G*(v.h-1)}' output_image.jpg

* filaments
      $> convert input_image.jpg -blur 0x5 -normalize -fx g \
     -sigmoidal-contrast 15x50% -solarize 50% output_image.jpg

*
