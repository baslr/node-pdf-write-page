
hummus = require 'hummus'
merge  = require 'merge'

module.exports = (opts) ->
  pdfWriter    = hummus.createWriterToModify opts.in, {modifiedFilePath:opts.out}
  pageModifier = new hummus.PDFPageModifier pdfWriter, opts.pageNumber

  ctx = pageModifier.startContext().getContext()
  cfg =
    font       : pdfWriter.getFontForFile "#{__dirname}/SourceSansPro-Regular.ttf"
    size       : 14
    colorspace : 'gray'
    color      : 0x00

  {
    write: (x, y, txt) ->
      ctx.writeText txt, x, y, cfg
      this

    end : () ->
      pageModifier.endContext().writePage()
      pdfWriter.end()

    cfg: (cfgIn) ->
      cfg = merge cfg, cfgIn
      if cfg.fontPath
        cfg.font = pdfWriter.getFontForFile cfg.fontPath
        delete cfg.fontPath
      this

    image: (x, y, path, opts = {}) ->
      ctx.drawImage x, y, path, opts
      this

    restoreCfg: () ->
      cfg =
        font       : pdfWriter.getFontForFile "#{__dirname}/SourceSansPro-Regular.ttf"
        size       : 14
        colorspace : 'gray'
        color      : 0x00
      this
  }
