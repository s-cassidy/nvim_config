require("oil").setup({
  keymaps = {
    ["<C-h>"] = false,
    ["<C-p>"] = false,
    ["<C-S-p>"] = "actions.preview"
  }
})
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
