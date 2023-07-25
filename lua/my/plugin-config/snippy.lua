require('snippy').setup({
  mappings = {
    is = {
      ['<C-space>'] = 'expand_or_advance',
      ['<C-k>'] = 'previous',
    },
    nx = {
      ['<Tab>'] = 'cut_text',
    },
  },
})
