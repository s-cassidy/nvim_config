return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      require("harpoon").setup({
        global_settings = { tabline = true } })

      local wk = require("which-key")

      --require("telescope").load_extension('harpoon')

      wk.register({
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>ha"] = { ':lua require("harpoon.mark").add_file()<CR>', "Add file to Harpoon" },
        ["<leader>h]"] = { ':lua require("harpoon.ui").nav_next()<CR>', "Next file" },
        ["<leader>h["] = { ':lua require("harpoon.ui").nav_prev()<CR>', "Prev file" },
        ["<leader>hm"] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Menu" },
        ["<leader>ht"] = { ':Telescope harpoon marks<CR>', 'Telescope' },
        ["<leader>fh"] = { ':Telescope harpoon marks<CR>', 'Harpoon' }
      })

      vim.keymap.set("n", "<M+1>", ':lua require("harpoon.ui").nav_file(1)')
      vim.keymap.set("n", "<M+2>", ':lua require("harpoon.ui").nav_file(2)')
      vim.keymap.set("n", "<M+3>", ':lua require("harpoon.ui").nav_file(3)')
      vim.keymap.set("n", "<M+4>", ':lua require("harpoon.ui").nav_file(4)')

      vim.keymap.set("n", "<A-j>", ':lua require("harpoon.ui").nav_next()<CR>', { silent = true }) -- next file
      vim.keymap.set("n", "<A-k>", ':lua require("harpoon.ui").nav_prev()<CR>', { silent = true }) -- previous file
    end
  },
}
