<pre>
8x8 Bayesian dithering algorithm
---------------------
by ANTIOCHIAN // 2k19
---------------------
Synopsis:
      dither(inputimage,edgethreshold);
  
  Description:
      Inputs an image file (JPG, PNG, BMP, etc) and applies an 8x8 dithering algorithm to produce a filtered "output.ext"
      Can outline result with a Prewitt edge-detecting algorithm depending on input args.
  
  Inputs:
    -inputimage:  The file location of the input image.
    -edgethreshold: A number between 0 and 1, determines sensitivity of edge detection (if left blank, does not apply edge detect at all)

  Outputs:
    -none except an output.ext file in folder
  
Sample use: dither(image.jpg, 0.45)
Sample output:
</pre>
![sample output](results.jpg)
