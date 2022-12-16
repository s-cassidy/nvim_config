
local wk = require("which-key") 

require("telescope").load_extension('harpoon')

wk.register({
  ["<leader>h"] = { name = "+harpoon" },
  ["<leader>ha"] = { ':lua require("harpoon.mark").add_file()<CR>', "Add file to Harpoon" },
  ["<leader>h]"] = { ':lua require("harpoon.ui").nav_next()<CR>', "Next file" },
  ["<leader>h["] = { ':lua require("harpoon.ui").nav_prev()<CR>', "Prev file" },
  ["<leader>hm"] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Menu" },
  ["<leader>ht"] = { ':Telescope harpoon marks<CR>', 'Telescope' },
  ["<leader>fh"] = { ':Telescope harpoon marks<CR>', 'Harpoon' }})
