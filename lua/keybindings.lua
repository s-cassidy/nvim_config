local map = vim.keymap.set

-- Normal Mode Remaps
local normal = {
  {"<C-d>", ":bd<cr>", {silent}}, -- delete current buffer
  {"j", "v:count ? 'j' : 'gj'",{silent, expr=true}}, -- j goes down by visual lines, unless a count is provided
  {"k", "v:count ? 'k' : 'gk'",{silent, expr=true}}, -- k goes up by visual lines, unless a count is provided
}

-- Insert mode remaps
local insert = {
  {"<A-l>", "<C-o>l", {silent}}, -- four mappings so that alt+hjkl moves cursor in insert
  {"<A-k>", "<C-o>k", {silent}},
  {"<A-j>", "<C-o>j", {silent}},
  {"<A-h>", "<C-o>h", {silent}}
}

-- Set bindings
for i, bind in ipairs(insert) do
  map("i", unpack(bind))
end

for i, bind in ipairs(normal) do
  map("n", unpack(bind))
end

local wk = require("which-key") 

wk.register({
  ["<leader>C"] = { name = "+config" },
  ["<leader>CE"] = { "<cmd>e ~/.config/nvim<CR>", "View config dir" },
  ["<leader>Ci"] = { "<cmd>e ~/.config/nvim/init.lua<CR>", "init.lua" },
  ["<leader>Cc"] = { "<cmd>e ~/.config/nvim/lua/colors.lua<CR>", "colours" },
  ["<leader>Cs"] = { "<cmd>e ~/.config/nvim/lua/settings.lua<CR>", "settings" },
  ["<leader>Ck"] = { "<cmd>e ~/.config/nvim/lua/keybindings.lua<CR>", "settings" },
  ["<leader>Cp"] = { "<cmd>e ~/.config/nvim/lua/plugins.lua<CR>", "colours" },
  ["<leader>Cl"] = { "<cmd>e ~/.config/nvim/lua/statusline.lua<CR>", "statusline" },
  ["<leader>CC"] = { "<cmd>so ~/.config/nvim/init.lua<CR>", "reload" },

  ["<leader>P"] = { name = "+packer" },
  ["<leader>Pi"] = { "<cmd>PackerInstall<CR>", "Install plugins"},
  ["<leader>Ps"] = { "<cmd>PackerStatus<CR>", "View plugins status"},
  ["<leader>Py"] = { "<cmd>PackerSync<CR>", "Sync plugins"},
  ["<leader>Pu"] = { "<cmd>PackerUpdate<CR>", "Update plugins"}

})


