require("telescope").load_extension("dir")

local wk = require('which-key')

wk.register({
  ["<leader>fd"] = {'dir...'},
  ["<leader>fdf"] = {':Telescope dir find_files', 'Find files'},
  ["<leader>fdg"] = {':Telescope dir live_grep', 'grep'},})

