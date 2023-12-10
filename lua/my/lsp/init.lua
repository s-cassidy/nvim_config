local lsp = require('lsp-zero')

require('lsp-zero').extend_lspconfig()

require('mason').setup()
require('mason-lspconfig').setup()

local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
  require('lspconfig')[server_name].setup({})
end

require 'lspconfig'.tsserver.setup {
  filetypes = { "javascript" }
}


require 'lspconfig'.intelephense.setup {}


require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'silent' },
      },
    },
  },
}



require('my.lsp.lsp')
require('my.lsp.webdev')
-- require('my.lsp.signatures')
