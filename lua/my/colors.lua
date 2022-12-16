vim.api.nvim_create_autocmd("ColorScheme", {command = "highlight Normal ctermbg=NONE guibg=NONE"})

-- vim.o.background='dark'
require('ayu').colorscheme()

