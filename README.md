# Multithreaded Buddhabrot (2012)

Buddhabrot is a visualization of the famous Mandelbrot fractal. Mandelbrot fractal shows whether or not a particle is in the Mandelbrot Set. Buddhabrot plots the escape paths of the particles, which are not in the set.

This Processing (processing.org) version divides the rendering process into threads to increase the speed of rendering. The output could be RGB, but I chose it to be grayscale instead. Because this is faster and also it is easier to import different variations into an image processor of your choice to play around with different channel combinations.

Still, you could extend this project to accompany all color channels (alpha even, if you feel adventurous). You'll see two extra variables for green and blue channels that I abandoned at some point.

The nebulabrot image in the sample output folder shows the combination of three different renderings with iterations 100, 1000 and 5000 respectively for red, green and blue channels.

This method is appropriately called nebulabrot, as it is the same method for visualizing astronomical bodies that emit light in wavelengths outside of visible spectrum. Mapping three, otherwise invisible wavelengths to RGB creates a similar aesthetics to mapping three renderings of the budhabrot to RGB.

## How to use
There are only two controls. Space toggles whether or not each iteration is displayed. The image is updated per pixel basis so turning it off gives a slight performance boost as your computer won't spend time for rendering the calculated values.

S key saves the image to a png file that contains the iteration information plus the timestamp in its name.

### Misc.
This is almost a decade old project and I just added the functionality of rendering into another PGraphics layer for variable output size (apparently I didn't know that back then), and this doesn't seem to agree entirely with having multithreads. Still, I haven't seen any glitches other than a conspicuously slow file writing process and I'm just putting this out there as many people wanted to see it.

When you plot the Mandelbrot set, each pixel is a direct output of the imaginary number that you're testing. In Buddhabrot however, testing a point for mandelbrot set and plotting its escape path draws trails stretching outside of that point.

The negative effect is that you cannot render a subsection without evaluating the entire space.

The positive (and awesome, to be honest) effect is that when you render a subsection, you see this weird effect resembling caustic light reflections such as the file "halfbrot". That rendering only takes into account the numbers within the bright band in the middle, but since buddhabrot shows the escape paths, these ghostly reflections appear outside the focus area.
