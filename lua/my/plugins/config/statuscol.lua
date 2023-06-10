local builtin = require("statuscol.builtin")
require("statuscol").setup({
  segments = {
    { text = { builtin.foldfunc } },
    { text = { "%s" } },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
    { text = { " " } }
  }
})
