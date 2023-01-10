-- vim.o.background='dark'

vim.api.nvim_create_autocmd("ColorScheme", { command = "highlight Normal ctermbg=NONE guibg=NONE" })
--require('ayu').setup({
--  overrides = {
--    panel_border = { fg = '#FFFFFF' }
--  }
--})

require('ayu').colorscheme()



require('nightfox').setup()
vim.cmd('colorscheme ayu')
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "fg" }) -- whatever your border color for the float is, check it with :highlight })
