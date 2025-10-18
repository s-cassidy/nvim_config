local function smartquotes() 
  vim.cmd([[%s:``\(.*\)'':“\1”:g]])
end

vim.keymap.set("n", [[<leader>"]], smartquotes, {buffer = true, desc = "Convert to curly quotes"})
