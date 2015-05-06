just write text in different color, font, and size to a existing pdf and save the result

### API

Example:

    pdf = require 'pdf-write-page'
    pdf {in:'test_unmodified.pdf', out:'test_modified.pdf', pageNumber:0}
    .write 10, 0, 'A'
    .write 10, 14, 'B'
    .cfg {size:60}
    .write 10, 28, 'C'
    .restoreCfg()
    .write 100, 100, 'D'
    .end()

`end` also saves to `out` path.

page offset is bottom, left (x = 0, y = 0)

#### write
writes some text

    .write(x, y, text)

#### image
add an image (jpg, pdf, tiff) to the pdf

copied from <https://github.com/galkahana/HummusJS/wiki/Show-images>

Optionally there's a 4th parameter which is an options object. The object may have the following properties, to modify the default image placement behaviour:

* `index` - for multi-page image formats (tiff, PDF), `index` determines the page to show. Default is the first image in the collection.
* `transformation` - transformation method. Can be either a array or an object. If it is a array, then transformation will be a 6 numbers matrix, allowing you to scale, rotate, translate or whatnot. If it is an object, than it is meant for defining an image fitting behaviour. You will define bounding with/height, and the module will scale the image in accordance. the object may have the following attributes:
    *  `width` - required, width of bounding box
    * `height` - required, height of bounding box
    * `proportional` - boolean, should the fit method maintain the image proportions?
    * `fit` - either `always` or `overflow`. If `always` Fit may always happen scaling up or down. If `overflow` fit will scale only if the image dimensions overflow the box.

example:

    .image()x, y, path, opts)

#### .cfg()
options:

    fontPath   : ''
    size       : 14
    colorspace : 'gray'
    color      : 0x00
