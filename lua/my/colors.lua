vim.api.nvim_create_autocmd("ColorScheme", { command = "highlight Normal ctermbg=NONE guibg=NONE" })

vim.cmd('colorscheme kanagawa')
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "fg" }) -- whatever your border color for the float is, check it with :highlight })
vim.api.nvim_set_hl(0, "Comment", { fg = "#E82424" }) -- set comment color to red. comments should stand out not hide away!
