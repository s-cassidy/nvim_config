--[[
local VAULT_DIR = "~/notes/wiki"
local TEMP_DIR = VAULT_DIR .. "/" .. "templates"

local date_indicator = "{{date}}"
local title_indicator = "{{title}}"

local snip = require("luasnip")
local io = require("io")

local file_list = vim.fn.system(string.fmt("ls %s", TEMP_DIR))

for filename in 
  dir(TEMP_DIR) do
  local template_path = TEMP_DIR .. "/" .. filename
  local file = io.open(template_path)
  local template = file:read("*a")
end 

file:close()
--]]
