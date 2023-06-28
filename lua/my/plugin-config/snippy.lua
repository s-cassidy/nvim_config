require('snippy').setup({
  mappings = {
    is = {
      ['<C-j>'] = 'expand_or_advance',
      ['<C-k>'] = 'previous',
    },
    nx = {
      ['<Tab>'] = 'cut_text',
    },
  },
})
