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

.write(x, y, text)



#### .cfg()
options:

    fontPath   : ''
    size       : 14
    colorspace : 'gray'
    color      : 0x00
