local map = vim.keymap.set

require('leap').set_default_keymaps()

-- Normal Mode Remaps
local normal = {
  {"<C-d>", ":bd<cr>", {silent=true}}, -- delete current buffer
  {"j", "v:count ? 'j' : 'gj'",{silent=true, expr=true}}, -- j goes down by visual lines, unless a count is provided
  {"k", "v:count ? 'k' : 'gk'",{silent=true, expr=true}}, -- k goes up by visual lines, unless a count is provided
  {"<CR>", "<cmd>Telescope oldfiles<cr><esc>k",{silent}}, -- k goes up by visual lines, unless a count is provided
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
  ["<leader>Ck"] = { "<cmd>e ~/.config/nvim/lua/keybindings.lua<CR>", "keymaps" },
  ["<leader>Cp"] = { "<cmd>e ~/.config/nvim/lua/plugins.lua<CR>", "plugins" },
  ["<leader>Cl"] = { "<cmd>e ~/.config/nvim/lua/statusline.lua<CR>", "statusline" },
  ["<leader>CC"] = { "<cmd>so ~/.config/nvim/init.lua<CR>", "reload" },

  ["<leader>P"] = { name = "+packer" },
  ["<leader>Pi"] = { "<cmd>PackerInstall<CR>", "Install plugins"},
  ["<leader>Ps"] = { "<cmd>PackerStatus<CR>", "View plugins status"},
  ["<leader>Py"] = { "<cmd>PackerSync<CR>", "Sync plugins"},
  ["<leader>Pu"] = { "<cmd>PackerUpdate<CR>", "Update plugins"}

})
local bufopts = { noremap=true, silent=true, buffer=bufnr }

-- LSP binds
wk.register({
  ["<leader>l"] = { name = "+lsp"},
  ["<leader>lr"] = { vim.lsp.buf.rename, "Rename" },
  ["<leader>ld"] = { vim.lsp.buf.definition, "Goto definition" },
  ["<leader>lD"] = { vim.lsp.buf.declaration, "Goto declaration" },
  ["<leader>li"] = { vim.lsp.buf.implementation, "Goto implementation" },
  ["<leader>lh"] = { vim.lsp.buf.hover, "hover" }
}, {buffer=bufnr})


--[[
wk.register({
  ["<leader>c"] = { name = "+comments"},
  ["<leader>cc"] = { comment.api.toggle.linewise, "Toggle line comment"},
  ["<leader>cC"] = { comment.api.toggle.blockwise, "Toggle block comment"},
  ["<leader>cC"] = { comment.api.toggle.blockwise, "Toggle block comment"}})
--]]


local builtin = require('telescope.builtin')
wk.register({
  ["<leader>f"] = { name = "+telescope" },
  ['<leader>ff'] =  {builtin.find_files, "Find files"},
  ['<leader>fg'] =  {builtin.live_grep, "grep files"},
  ['<leader>fb'] =  {builtin.buffers, "Current buffers"},
  ['<leader>fd'] =  {builtin.diagnostics, "Diagnostics"},
  ['<leader>fh'] =  {builtin.help_tags, "Help tags"}})
