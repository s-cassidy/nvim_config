local ls require("luasnip")

local ls = require "luasnip"

local t = ls.text_node
local i = ls.insert_node

--[[ls.add_snippets(
  "python", {
    ls.snippet("def", 
    {
      t("def "), i(1, "function"), t("("), i(2, "params"), t({"):",
    "$PARENT_INDENT    "}), i(0)
    }
    )
  }
)
--]]
