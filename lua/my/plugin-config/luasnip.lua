require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
local map = vim.keymap.set

ls.config.set_config({
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI"
})


require("luasnip.loaders.from_lua").load({ paths = "./lua/my/snippets/" })
ls.filetype_extend("javascriptreact", { "javascript", "html" })
-- vim.keymap.set({ "i", "s" }, "<C-spc>", function()
--   if ls.expand_or_jumpable() then ls.expand_or_jump() end
-- end, { silent = true })
