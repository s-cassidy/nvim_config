--[[ require("luasnip.loaders.from_snipmate").lazy_load()
local ls = require("luasnip")
local map = vim.keymap.set

ls.config.set_config({
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI"
})

map({ "i", "s" }, "<C-j>", function()
  if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, { silent = true })

require("luasnip.loaders.from_lua").load({ paths = "./lua/my/snippets/" }) ]]
