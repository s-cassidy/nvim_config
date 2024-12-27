local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-space>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-space>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-s-space>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
local map = vim.keymap.set

ls.config.set_config({
  enable_autosnippets = true,
  history = true,
  updateevents = "TextChanged,TextChangedI"
})


require("luasnip.loaders.from_lua").load({ paths = "./lua/my/snippets/" })
ls.filetype_extend("javascriptreact", { "javascript", "html" })
-- vim.keymap.set({ "i", "s" }, "<C-spc>", function()
--   if ls.expand_or_jumpable() then ls.expand_or_jump() end
-- end, { silent = true })

local edit = function()
  require("luasnip.loaders").edit_snippet_files {
    format = function(_, source_name)
      if source_name == "snippets" then
        return nil
      end
    end
    ,
    extend = function(ft, _)
      return {
        { ft,
          string.format(("%s/%s.lua"), "~/.config/nvim/lua/my/snippets", ft)
        }
      }
    end
  }
end
print("Hello")

vim.api.nvim_create_user_command("LuaSnipEdit", edit, {})
