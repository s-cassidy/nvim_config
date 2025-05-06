require("oil").setup({
  keymaps = {
    ["<C-h>"] = false,
    ["<C-p>"] = false,
    ["<C-S-p>"] = "actions.preview",
    ["<M-/>"] = { "actions.select", opts = { close=true, vertical = true }  },
    ["<M-->"] = { "actions.select", opts = { close=true, horizontal = true } },
}})

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
