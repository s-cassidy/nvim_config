require('snippy').setup({
  mappings = {
    is = {
      ['<C-f>'] = 'expand_or_advance',
      ['<CR>'] = 'expand_or_advance',
      ['<C-x>'] = 'previous',
    },
    nx = {
      ['<leader>x'] = 'cut_text',
    },
  },
})
