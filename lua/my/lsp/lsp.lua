local lsp = require('lsp-zero')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = false,
  cmp_capabilities = false,
  manage_nvim_cmp = false,
  call_servers = 'local',
}
)

local cmp = require('cmp')
local cmp_config = require('lsp-zero').defaults.cmp_config({})



-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })


vim.api.nvim_create_autocmd({ "BufWritePre" },
  { command = [[lua vim.lsp.buf.format()]] })


local wk = require('which-key')
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

-- vim.diagnostic.config({ virtual_lines = { only_current_line = true } })


wk.register({
  ["<leader>lf"] = { toggle_floating_diagnostics, "toggle floating diagnostics" },
  ["<leader>ll"] = { lines_toggle, "Toggle lsp-lines" },
})


local signs = { Error = "!!", Warn = ">>", Hint = "--", Info = "??" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
