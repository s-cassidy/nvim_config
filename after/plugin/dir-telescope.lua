require("telescope").load_extension("dir")
require("dir-telescope").setup({
  hidden = true,
  respect_gitignore = true,
})
local wk = require('which-key')

wk.register({
  ["<leader>fD"] = { 'dir...' },
  ["<leader>fDf"] = { ':Telescope dir find_files', 'Find files' },
  ["<leader>fDg"] = { ':Telescope dir live_grep', 'grep' },
})
