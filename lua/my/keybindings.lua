local map = vim.keymap.set

require('leap').set_default_keymaps()
-- Normal Mode Remaps
local normal = {
  { "<C-s-D>", ":bd<cr>", { silent = true } }, -- delete current buffer
  { "<C-n>", ":bn<cr>", { silent = true } }, -- next buffer
  { "<C-p>", ":bp<cr>", { silent = true } }, -- previous buffer
  { "j", "v:count ? 'j' : 'gj'", { silent = true, expr = true } }, -- j goes down by visual lines, unless a count is provided
  { "k", "v:count ? 'k' : 'gk'", { silent = true, expr = true } }, -- k goes up by visual lines, unless a count is provided
  { "Ja", "mzJ`z" }, -- append line below to current line without moving cursor
  { "n", "nzzzv" },
  { "N", "Nzzzv" }, -- cursor stays centered when searching
  { "<C-u>", "<C-u>zz" }, -- moving up/down keep cursor centered -- less disorientating
  { "<C-d>", "<C-d>zz" }, -- moving up/down keep cursor centered -- less disorientating
  { "d ", "dd" }, -- faster/more comfortable than double jumping?
  { "y ", "yy" } -- faster/more comfortable than double jumping?
}

require 'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
}

-- Insert mode remaps
local insert = {
  { "<A-l>", "<C-o>l", { silent } }, -- four mappings so that alt+hjkl moves cursor in insert
  { "<A-k>", "<C-o>k", { silent } },
  { "<A-j>", "<C-o>j", { silent } },
  { "<A-h>", "<C-o>h", { silent } }
}

-- Visual mode remaps
local visual = {
  { "J", ":m '>+1<CR>gv=gv", { silent } },
  { "K", ":m '<-2<CR>gv=gv", { silent } },
  { "<leader>P", '"_dP' } -- paste over selection without adding pasted-over text to the register
}

-- all modes
local not_insert = {
  { "<leader>y", '"+y' }, -- yank to clipboard
  { "<leader>Y", '"+Y' }, -- yank to clipboard
  { "<leader>p", '"+p' }, -- paste from clipboard
  { "<leader>d", '"_d' }, -- true delete - not saved to any register
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
  ["<leader>Cc"] = { "<cmd>e ~/.config/nvim/lua/my/colors.lua<CR>", "colours" },
  ["<leader>Cs"] = { "<cmd>e ~/.config/nvim/lua/my/settings.lua<CR>", "settings" },
  ["<leader>Ck"] = { "<cmd>e ~/.config/nvim/lua/my/keybindings.lua<CR>", "keymaps" },
  ["<leader>Cp"] = { "<cmd>e ~/.config/nvim/lua/my/plugins.lua<CR>", "plugins" },
  ["<leader>Cl"] = { "<cmd>e ~/.config/nvim/lua/my/statusline.lua<CR>", "statusline" },
  ["<leader>CC"] = { "<cmd>so ~/.config/nvim/init.lua<CR>", "reload" },
  ["<leader>#"] = { ":buffer #<CR>", "Alt buffer" },
})
local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- LSP binds
wk.register({
  ["<leader>l"] = { name = "+lsp" },
  ["<leader>lR"] = { vim.lsp.buf.rename, "Rename" },
  ["<leader>ld"] = { vim.lsp.buf.definition, "Goto definition" },
  ["gd"] = { vim.lsp.buf.definition, "Goto definition" },
  ["<leader>lD"] = { vim.lsp.buf.declaration, "Goto declaration" },
  ["<leader>li"] = { vim.lsp.buf.implementation, "Goto implementation" },
  ["<leader>lr"] = { vim.lsp.buf.references, "References to QF" },
  ["<leader>lh"] = { vim.lsp.buf.hover, "hover" },
  ["<leader>ll"] = { vim.diagnostic.setloclist, "Diagnostics to local qf" }
}, { buffer = bufnr })


wk.register({ ["<leader>"] = {
  y = { '"+y', "Yank to clipboard" },
  Y = { '"+Y', "Yank to clipboard" },
  d = { '"+d', "Cut to clipboard" },
  p = { '"+p', "Paste from clipboard" },
} })

wk.register({ ["<leader>"] = {
  y = { '"+y', "Yank to clipboard" },
  d = { '"+d', "Cut to clipboard" },
  p = { '"+p', "Paste from clipboard" },
  P = { '"+P', "Paste over and keep" }
} }, { mode = "v" })

--[[
wk.register({
  ["<leader>c"] = { name = "+comments"},
  ["<leader>cc"] = { comment.api.toggle.linewise, "Toggle line comment"},
  ["<leader>cC"] = { comment.api.toggle.blockwise, "Toggle block comment"},
  ["<leader>cC"] = { comment.api.toggle.blockwise, "Toggle block comment"}})
--]]



wk.register({
  ["<leader>Q"] = { name = "+global quickfix" },
  ["<leader>Qq"] = { ":copen<cr>", "open quickfix" },
  ["<leader>Qn"] = { ":cnext<cr>", "next quickfix" },
  ["<leader>Qp"] = { ":cprev<cr>", "previous quickfix" }
})

wk.register({
  ["<leader>q"] = { name = "+local quickfix" },
  ["<leader>qq"] = { ":lopen<cr>", "open local quickfix" },
  ["<leader>qn"] = { ":lnext<cr>", "next local quickfix" },
  ["<leader>qp"] = { ":lprev<cr>", "previous local quickfix" }
})

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
wk.register({
  ["<leader>f"] = { name = "+telescope" },
  ['<leader>fz'] = { builtin.git_files, "Find files" },
  ['<leader>fg'] = { builtin.live_grep, "grep files" },
  ['<leader>fg'] = { builtin.live_grep, "grep files" },
  ['<leader>fy'] = { ":Telescope neoclip<cr>", "yanks clipboard" },
  ['<leader>fb'] = { builtin.buffers, "Current buffers" },
  ['<leader>fD'] = { builtin.diagnostics, "Diagnostics" },
  ['<leader>fh'] = { builtin.help_tags, "Help tags" },
  ['<leader>fu'] = { ":lua require('telescope').extensions.undo.undo()<cr><esc>k", "View undo tree" }
})

-- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
wk.register({
  ["<leader>v"] = { ":lua local builtin = require 'telescope.builtin' builtin.find_files({cwd = '~/notes/wiki'})<CR>",
    "Go to vault" }
})
