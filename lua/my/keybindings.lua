local map = vim.keymap.set

require('leap').set_default_keymaps()

-- Normal Mode Remaps
local normal = {
  {"<C-D>", ":bd<cr>", {silent=true}}, -- delete current buffer
  {"<C-L>", ":bn<cr>", {silent=true}}, -- next buffer
  {"<C-H>", ":bp<cr>", {silent=true}}, -- previous buffer
  {"j", "v:count ? 'j' : 'gj'",{silent=true, expr=true}}, -- j goes down by visual lines, unless a count is provided
  {"k", "v:count ? 'k' : 'gk'",{silent=true, expr=true}}, -- k goes up by visual lines, unless a count is provided
  {"<CR>", "<cmd>Telescope oldfiles<cr><esc>k",{silent}}, -- k goes up by visual lines, unless a count is provided
  {"Ja", "mzJ`z"},  -- append line below to current line without moving cursor
  {"n", "nzzzv"},
  {"N", "Nzzzv"}, -- cursor stays centered when searching
  --{"<C-u>","<C-u>zz"}, -- moving up/down keep cursor centered -- less disorientating
  --{"<C-d>","<C-d>zz"} -- moving up/down keep cursor centered -- less disorientating
}

-- Insert mode remaps
local insert = {
  {"<A-l>", "<C-o>l", {silent}}, -- four mappings so that alt+hjkl moves cursor in insert
  {"<A-k>", "<C-o>k", {silent}},
  {"<A-j>", "<C-o>j", {silent}},
  {"<A-h>", "<C-o>h", {silent}}
}

-- Visual mode remaps
local visual = {
  {"J", ":m '>+1<CR>gv=gv", {silent}},
  {"K", ":m '<-2<CR>gv=gv", {silent}},
  {"<leader>P", '"_dP'} -- paste over selection without adding pasted-over text to the register
}

-- all modes
local not_insert = {
  {"<leader>y", '"+y'}, -- yank to clipboard
  {"<leader>Y", '"+Y'}, -- yank to clipboard
  {"<leader>p", '"+p'}, -- paste from clipboard
  {"<leader>d", '"_d'}, -- true delete - not saved to any register
}
-- Set bindings
for i, bind in ipairs(insert) do
  map("i", unpack(bind))
end

for i, bind in ipairs(normal) do
  map("n", unpack(bind))
end

for i, bind in ipairs(visual) do
  map("v", unpack(bind))
end

for i, bind in ipairs(not_insert) do
  map("v", unpack(bind))
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


wk.register({["<leader>"] = {
  y = {"Yank to clipboard"},
  Y = {"Yank to clipboard"},
  d = {"Cut to clipboard"},
  p = {"Paste from clipboard"},
  }})

wk.register({["<leader>"] = {
  y = {"Yank to clipboard"},
  d = {"Cut to clipboard"},
  p = {"Paste from clipboard"},
  P = {"Paste over and keep"}}}, {mode = "v"})

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
  ['<leader>fz'] =  {builtin.git_files, "Find files"},
  ['<leader>fg'] =  {builtin.live_grep, "grep files"},
  ['<leader>fb'] =  {builtin.buffers, "Current buffers"},
  ['<leader>fD'] =  {builtin.diagnostics, "Diagnostics"},
  ['<leader>fh'] =  {builtin.help_tags, "Help tags"}})
