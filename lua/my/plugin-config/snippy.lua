require('snippy').setup({
  mappings = {
    is = {
      ['<C-space>'] = 'expand_or_advance',
      ['<C-x>'] = 'previous',
    },
    nx = {
      ['<Tab>'] = 'cut_text',
    },
  },
})
