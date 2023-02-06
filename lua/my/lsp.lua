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

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

require 'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'silent' },
      },
    },
  },
}

require('lsp-zero').set_sign_icons()
vim.diagnostic.config(require('lsp-zero').defaults.diagnostics({}))

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = false,
  manage_nvim_cmp = false,
  call_servers = 'local',
}
)


local cmp = require('cmp')
local cmp_config = require('lsp-zero').defaults.cmp_config({})



require('lint').linters_by_ft = {
  python = { 'flake8', 'mypy' },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})


--require("formatter").setup(
--{
--  logging = true,
--  filetype = {
--  javascript = {
--    function()
--      return {
--        exe = "npx prettier",
--        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
--        stdin = true
--      }
--    end
--  },
--}
--})

vim.api.nvim_create_autocmd({ "BufWritePre" },
  { command = [[lua vim.lsp.buf.format()]] })

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
local wk = require('which-key')
vim.o.updatetime = 250
local floatdiag = 0;
local toggle_diagnostics = function()
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
wk.register({
  ["<leader>lf"] = { toggle_diagnostics, "toggle diagnostics" }
})



local signs = { Error = "!!", Warn = ">>", Hint = "--", Info = "??" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
