--[[ local ls = require("luasnip")
local types = require("luasnip.util.types")
-- require('telescope').load_extension('luasnip')
ls.config.set_config({

  history = true,
  -- allows updating of snippets as you type
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,

  --   ext_ops={
  --     [types.choicenode] = {
  --       active = {virt_text = { {"!", "Error"} },
  --     },
  --   },
  -- }
}
)

vim.keymap.set({ 'i', 's' }, "<c-f>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, "<c-x>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })


vim.keymap.set({ 'i', 's' }, "<C-c>", function()
  if ls.choice_active then
    ls.change_choice()
  end
end, { silent = true })

local wk = require('which-key')
wk.register({
  ["<leader>s"] = { "snippets" },
  ["<leader>ss"] = { ":source ~/.config/nvim/after/plugin/luasnip.lua<CR>", "Reload snippets" }
}) ]]
