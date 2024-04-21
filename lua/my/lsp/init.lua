-- local lsp = require('lsp-zero')

-- require('lsp-zero').extend_lspconfig()

require('mason').setup()
require('mason-lspconfig').setup()

local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
  require('lspconfig')[server_name].setup({})
end

-- require 'lspconfig'.tsserver.setup {
--   filetypes = { "javascript" }
-- }


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

vim.api.nvim_create_autocmd({ "BufWritePre" },
  { command = [[lua vim.lsp.buf.format()]] })


vim.o.updatetime = 250
local floatdiag = 0;
local toggle_floating_diagnostics = function()
  if floatdiag == 0 then
    vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "DiagnosticFloat",
      pattern = { "*" },
      command = [[lua vim.diagnostic.open_float(nil, {focus=false})]]
    })
    floatdiag = 1
  else
    floatdiag = 0
    vim.cmd [[
  autocmd! DiagnosticFloat CursorHold,CursorHoldI *
  ]]
  end
end

vim.keymap.set("n", "<leader>lf", toggle_floating_diagnostics, { desc = "toggle floating diagnostics" })
vim.diagnostic.config({ virtual_text = false, })

local signs = { Error = "!!", Warn = ">>", Hint = "--", Info = "??" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end



require 'lspconfig'.html.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- require 'lspconfig'.tailwindcss.setup {
--   capabilities = capabilities,
-- }

require('my.lsp.signatures')
