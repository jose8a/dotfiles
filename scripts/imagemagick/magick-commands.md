[[toc]]

---
### 1 - convert to grey

convert steph-project-bg.jpg -colorspace gray -sigmoidal-contrast 10,40% project_grey.jpg


---
### 2 - convert the grey to sepia-wheat

convert project_grey.jpg  -fill wheat   -tint 100    sepia_wheat.jpg


---
### 3 - create an (almost)-white canvas same size as other images
* [canvas creation](http://www.imagemagick.org/Usage/canvas/)

convert project_grey.jpg -fill white +opaque black canvas-white.jpg


---
### 4 - create canvas from image w/fill color ($color .. e.g. wheat, green3, etc)

convert project_grey.jpg -fill $COLOR -colorize 50% +opaque black canvas-$COLOR.jpg
convert project_grey.jpg -fill wheat -colorize 50% +opaque black canvas-wheat.jpg
convert project_grey.jpg -fill green3 -colorize 50% +opaque black canvas-green3.jpg


---
### 5 - composite and fade images

convert project_grey.jpg -fill wheat -colorize 70% -opaque black canvas-faded-wheat-70.jpg
convert project_grey.jpg -fill grey90 -colorize 70% -opaque black canvas-faded-grey90-70.jpg


---
### 6 - crop image % in size - from the center

convert IMAGE.jpg -gravity Center -crop 90%x+0+0 cropped/IMAGE-crop-center.gif
convert project_grey.jpg -gravity Center -crop 90%x+0+0  cropped/project-grey-crop-center.gif



<!-- ======================================================= -->

## References

### Local Dev
  * [Previews via @http-server](http://localhost:3400/)
  * [Dev files](file:///Users/jose8a/Desktop/stef-project)


### IM Advanced techniques
  * [IM techniques](https://im.snibgo.com/)
  * [Fred's IM Scripts](http://www.fmwconcepts.com/imagemagick/index.php)


### CSS Image Effects
  * [Mix Blend Modes - CSS-Tricks](https://css-tricks.com/almanac/properties/m/mix-blend-mode/)
  * [Sara Soueidan Blog Post](https://www.sarasoueidan.com/blog/compositing-and-blending-in-css/)
  * [CSS Filters](https://css-tricks.com/almanac/properties/f/filter/)


### imagemagick compose/blend modes:
  * [compose usage](https://www.imagemagick.org/Usage/compose/)
  * [compose methods](https://imagemagick.org/script/compose.php)
  * mathematical-composition methods available:
    + multiply
    + screen
    + plus
    + add
    + minus
    + subtract
    + difference
    + exclusion
    + darken
    + lighten
  * lighten-composition methods available:
    + linear-dodge
    + linear-burn
    + color-dodge
    + color-burn
    + overlay
    + hard-light
    + linear-light
    + soft-light
    + pegtop-light
    + vivid-light
    + pin-light
  * ..



### [imagemagick color swatch](https://imagemagick.org/script/color.php)
  * ..


### compose images (here w/'overlay' blend-mode)
convert \
\( in.jpg -colorspace gray -alpha set -channel alpha -evaluate set 50% +channel \) \
\( -clone 0 -alpha off -fill "#ff9090" -colorize 100 \) \
+swap \
-compose overlay -composite out.jpg


