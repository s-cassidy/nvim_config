
local wk = require("which-key") 

wk.register({
  ["<leader>C"] = { name = "+config" },
  ["<leader>CE"] = { "<cmd>e ~/.config/nvim<CR>", "View config dir" },
  ["<leader>Ci"] = { "<cmd>e ~/.config/nvim/init.lua<CR>", "init.lua" },
  ["<leader>Cc"] = { "<cmd>e ~/.config/nvim/lua/colors.lua<CR>", "colours" },
  ["<leader>Cs"] = { "<cmd>e ~/.config/nvim/lua/settings.lua<CR>", "settings" },
  ["<leader>Cp"] = { "<cmd>e ~/.config/nvim/lua/plugins.lua<CR>", "colours" },
  ["<leader>Cl"] = { "<cmd>e ~/.config/nvim/lua/statusline.lua<CR>", "statusline" },
})
