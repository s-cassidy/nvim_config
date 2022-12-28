local lsp = require('lsp-zero')

require'lspconfig'.tsserver.setup {
filetypes = {"javascript"}}

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'silent'},
      },
    },
  },
}

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = false,
  call_servers = 'local',
  }
)

lsp.setup()


require('lint').linters_by_ft = {
  python = {'flake8'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})


-- Everything below here is copied in to display diagnostics at the bottom of the screen rather than floating

local function setup_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
end
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]



local signs = { Error = "!!", Warn = ">>", Hint = "--", Info = "??" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
