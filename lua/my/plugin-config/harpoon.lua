require('harpoon').setup(
  {
    tabline = true,
    tabline_icons = true,
    tabline_prefix = '   '
  }
)

local wk = require("which-key")

--require("telescope").load_extension('harpoon')

local binds = {
  ["<leader>h"] = { name = "+harpoon" },
  { "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>',        { desc = "Add file to Harpoon" } },
  { "<leader>h]", ':lua require("harpoon.ui").nav_next()<CR>',          { desc = "Next file" } },
  { "<leader>h[", ':lua require("harpoon.ui").nav_prev()<CR>',          { desc = "Prev file" } },
  { "<leader>hm", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = "Menu" } },
  { "<leader>ht", ':Telescope harpoon marks<CR>',                       { desc = 'Telescope' } },
  { "<leader>fh", ':Telescope harpoon marks<CR>',                       { desc = 'Harpoon' } }
}

for _, bind in ipairs(binds) do
  vim.keymap.set("n", unpack(bind))
end

vim.keymap.set("n", "<A-1>", ':lua require("harpoon.ui").nav_file(1)<CR>', { silent = true })
vim.keymap.set("n", "<A-2>", ':lua require("harpoon.ui").nav_file(2)<CR>', { silent = true })
vim.keymap.set("n", "<A-3>", ':lua require("harpoon.ui").nav_file(3)<CR>', { silent = true })
vim.keymap.set("n", "<A-4>", ':lua require("harpoon.ui").nav_file(4)<CR>', { silent = true })
vim.keymap.set("n", '<C-s>', '<cmd>lua require("harpoon.mark").toggle_file()<cr>', { desc = 'Pin on Harpoon' })
