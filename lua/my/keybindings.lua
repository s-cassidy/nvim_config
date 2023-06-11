local map = vim.keymap.set

-- Normal Mode Remaps
local normal = {
  { "<C-s-D>",   ":bd<cr>",                    { silent = true } },              -- delete current buffer
  { "<C-s-t>",   ":ObsidianTemplate<cr>",      { silent = true } },
  { "<S-l>",     ":bn<cr>",                    { silent = true } },              -- next buffer
  { "<S-h>",     ":bp<cr>",                    { silent = true } },              -- previous buffer
  { "j",         "v:count ? 'j' : 'gj'",       { silent = true, expr = true } }, -- j goes down by visual lines, unless a count is provided
  { "k",         "v:count ? 'k' : 'gk'",       { silent = true, expr = true } }, -- k goes up by visual lines, unless a count is provided
  { "<leader>J", "mzJ`z",                      { desc = "Append line below" } }, -- append line below to current line without moving cursor
  { "n",         "nzzzv" },
  { "N",         "Nzzzv" },                                                      -- cursor stays centered when searching
  { "<C-u>",     "<C-u>zz" },                                                    -- moving up/down keep cursor centered -- less disorientating
  { "<C-d>",     "<C-d>zz" },                                                    -- moving up/down keep cursor centered -- less disorientating
  { "d ",        "dd" },                                                         -- faster/more comfortable than double jumping?
  { "y ",        "yy" },                                                         -- faster/more comfortable than double jumping?
  { "<C-Up>",    "<cmd>resize +2<cr>" },                                         -- resize windows with ctrl + arrows
  { "<C-Down>",  "<cmd>resize -2<cr>" },
  { "<C-Left>",  "<cmd>vertical resize -2<cr>" },
  { "<C-Right>", "<cmd>vertical resize +2<cr>" },
  { "<esc>",     "<cmd>noh<cr><esc>" }, -- esc also clears hlsearch
  { "<C-w>|",    "<cmd>vsplit<cr>" },
  { "<C-w>-",    "<cmd>split<cr>" },
  { "<CR>",      "o<esc>" },
  { "<S-CR>",    "O<esc>" },
}


-- Insert mode remaps
local insert = {
  { "<esc>", "<cmd>noh<cr><esc>" }, -- esc also clears hlsearch
  -- Add undo points at convenient punctuation marks
  { ",",     ",<c-g>u" },
  { ".",     ".<c-g>u" },
  { ";",     ";<c-g>u" },
}

-- Visual mode remaps
local visual = {
  { "J",         ":m '>+1<CR>gv=gv", { silent } },
  { "K",         ":m '<-2<CR>gv=gv", { silent } },
  { "<leader>P", '"_dP' }, -- paste over selection without adding pasted-over text to the register
  { "<",         "<gv" },  -- better indents
  { ">",         ">gv" },
}

-- all non-insert modes
local not_insert = {
  { "<leader>y", '"+y', { desc = "Yank to clipboard" } },
  { "<leader>Y", '"+Y', { desc = "Yank end of line to clipboard" } },
  { "<leader>d", '"+d', { desc = "Cut to clipboard" } },
  { "<leader>p", '"+p', { desc = "Paste from clipboard" } },
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

-- make b an "inclusive" motion when used with an operator i.e. includes the starting letter
map("o", "b", "vb")

local wk = require("which-key")

local def = { vim.lsp.buf.definition, "Goto definition" }
local dec = { vim.lsp.buf.declaration, "Goto declaration" }
local imp = { vim.lsp.buf.implementation, "Goto implementation" }
local hov = { vim.lsp.buf.hover, "hover" }

wk.register({
  ["[<Tab>"] = { ":tabp<CR>", "Tab previous" },
  ["]<Tab>"] = { ':tabn<CR>', "Tab next" },
  ["<leader>C"] = { name = "+config" },
  ["<leader>CE"] = { "<cmd>e ~/.config/nvim<CR>", "View config dir" },
  ["<leader>CP"] = { "<cmd>e ~/.config/nvim/lua/my/plugin-config<CR>", "Configure individual plugins" },
  ["<leader>Ci"] = { "<cmd>e ~/.config/nvim/init.lua<CR>", "init.lua" },
  ["<leader>Cc"] = { "<cmd>e ~/.config/nvim/lua/my/colors.lua<CR>", "colours" },
  ["<leader>Cs"] = { "<cmd>e ~/.config/nvim/lua/my/settings.lua<CR>", "settings" },
  ["<leader>Ck"] = { "<cmd>e ~/.config/nvim/lua/my/keybindings.lua<CR>", "keymaps" },
  ["<leader>Cp"] = { "<cmd>e ~/.config/nvim/lua/my/plugins<CR>", "plugins" },
  ["<leader>#"] = { ":buffer #<CR>", "Alt buffer" },

  -- LSP binds
  ["<leader>l"] = { name = "+lsp" },
  ["<leader>lR"] = { vim.lsp.buf.rename, "Rename" },
  ["<leader>ll"] = { require("lsp_lines").toggle, "Toggle lsp-lines" },
  ["<leader>ld"] = def,
  ["gd"] = def,
  ["<leader>lD"] = def,
  ["gD"] = dec,
  ["<leader>li"] = imp,
  ["gi"] = imp,
  ["<leader>lr"] = { vim.lsp.buf.references, "References to QF" },
  ["<leader>lh"] = hov,
  ["K"] = hov,
  ["<leader>lL"] = { vim.diagnostic.setloclist, "Diagnostics to local qf" },


  -- Quickfix menu
  ["<leader>Q"] = { ":copen<cr>", "Toggle global quickfix" },
  ["<leader>q"] = { ":lopen<cr>", "Toggle local quickfix" },

  -- Splits

  ["<leader>w"] = { name = "+window" },
  ["<leader>wd"] = { "<C-W>c", "close window" },
  ["<leader>ww"] = { "<C-W>w", "close window" },
  ["<leader>w-"] = { "<C-W>s", "horizontal split" },
  ["<leader>w|"] = { "<C-W>v", "vertical split" },
})

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

vim.api.nvim_create_user_command("Q", "wqall", {})
