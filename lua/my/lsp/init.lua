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
require "lsp_signature".setup(
  {
    handler_opts = {
      border = "none"   -- double, rounded, single, shadow, none, or a table of borders
    },
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    hint_enable = true, -- virtual hint enable
    hint_prefix = {
      above = "↙ ",  -- when the hint is on the line above the current line
      current = "← ",  -- when the hint is on the same line
      below = "↖ "  -- when the hint is on the line below the current line
    }
  }
)

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {desc = "Format buffer", silent = true})
