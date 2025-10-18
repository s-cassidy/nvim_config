require('mason').setup()
require('mason-lspconfig').setup()


vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'silent' },
      },
    },
  },
})



vim.lsp.enable("html")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("cssls", {
  capabilities = capabilities,
})

-- require('my.lsp.signatures')

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {desc = "Format buffer", silent = true})
