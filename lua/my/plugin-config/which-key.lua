local wk = require("which-key")
wk.add({
  { "<leader>C",  name = "+config" },
  { "<leader>l",  name = "+lsp" },
  { "<leader>g",  name = "+git" },
  { "<leader>w",  name = "+window" },
  { "<leader>s",  name = "+sessions" },
  { "<leader>f",  name = "+telescope" },
  { "<leader>m",  name = "+microblog" },
  { "<leader>c",  name = "+symbols" },
  { "<leader>x",  name = "+diagnostics" },
  { "<leader>h",  name = "+harpoon" },
  { "<leader>ff", 'dir...' },
  { "g<c-g>",     'Word count' },
})


vim.api.nvim_create_augroup('which-key-locals', { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.tex",
  group = "which-key-locals",
  callback = function()
    require("which-key").add({ "<leader>t", name = "+tex", buffer = true })
  end
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*/notes/todo/*.txt",
  group = "which-key-locals",
  callback = function()
    require("which-key").add({ "<leader>t", name = "+tasks", buffer = true })
  end
})
