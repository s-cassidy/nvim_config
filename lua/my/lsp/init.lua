require('mason').setup()
require('mason-lspconfig').setup()


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



require 'lspconfig'.html.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- require('my.lsp.signatures')

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {desc = "Format buffer", silent = true})
