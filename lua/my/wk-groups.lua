local wk = require("which-key")
wk.register({
  ["<leader>C"] = { name = "+config" },
  -- LSP binds
  ["<leader>l"] = { name = "+lsp" },
  ["<leader>t"] = { name = "+tasks" },
  ["<leader>w"] = { name = "+window" },
  ["<leader>s"] = { name = "+sessions" },
  ["<leader>f"] = { name = "+telescope" },
  ["<leader>h"] = { name = "+harpoon" },
  ["<leader>ff"] = { 'dir...' },
})
