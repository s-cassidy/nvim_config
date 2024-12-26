-- VimTeX configuration goes here, e.g.
vim.g.vimtex_view_method = "zathura"
vim.api.nvim_create_augroup('tex', { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.tex",
  group = "tex",
  callback = function()
    require("which-key").add({ "<leader>t", name = "+tex", buffer = true })
    vim.keymap.set("n", "<leader>tc", ":VimtexCompile<cr>", { buffer = true, silent = true, desc = "Compile tex" })
    vim.keymap.set("n", "<leader>tr", ":VimtexReload<cr>", { buffer = true, silent = true, desc = "Reload pdf" })
    vim.keymap.set("n", "<leader>tt", ":VimtexTocToggle<cr>",
      { buffer = true, silent = true, desc = "Table Of Contents" })
  end
})
