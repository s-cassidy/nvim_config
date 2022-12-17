-- vim.o.background='dark'

vim.api.nvim_create_autocmd("ColorScheme", {command = "highlight Normal ctermbg=NONE guibg=NONE"})

require('ayu').colorscheme()
vim.cmd('colorscheme ayu')

