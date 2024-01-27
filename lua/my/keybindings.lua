local map = vim.keymap.set


-- Normal Mode Remaps
local normal = {
  { "<C-s-D>",    ":bd<cr>",                                          { silent = true } },              -- delete current buffer
  { "<C-s-t>",    ":ObsidianTemplate<cr>",                            { silent = true } },
  { "<S-l>",      "$",                                                { silent = true } },              -- end of line
  { "<S-h>",      "^",                                                { silent = true } },              -- start of line
  { "j",          "v:count ? 'j' : 'gj'",                             { silent = true, expr = true } }, -- j goes down by visual lines, unless a count is provided
  { "k",          "v:count ? 'k' : 'gk'",                             { silent = true, expr = true } }, -- k goes up by visual lines, unless a count is provided
  { "<leader>J",  "mzJ`z",                                            { desc = "Append line below" } }, -- append line below to current line without moving cursor
  { "n",          "nzzzv" },
  { "N",          "Nzzzv" },                                                                            -- cursor stays centered when searching
  { "<C-u>",      "<C-u>zz" },                                                                          -- moving up/down keep cursor centered -- less disorientating
  { "<C-d>",      "<C-d>zz" },                                                                          -- moving up/down keep cursor centered -- less disorientating
  { "d ",         "dd" },                                                                               -- faster/more comfortable than double jumping?
  { "y ",         "yy" },                                                                               -- faster/more comfortable than double jumping?
  { "<C-Up>",     "<cmd>resize +2<cr>" },                                                               -- resize windows with ctrl + arrows
  { "<C-Down>",   "<cmd>resize -2<cr>" },
  { "<C-Left>",   "<cmd>vertical resize -2<cr>" },
  { "<C-Right>",  "<cmd>vertical resize +2<cr>" },
  { "<esc>",      "<cmd>noh<cr><esc>" }, -- esc also clears hlsearch
  { "<C-w>|",     "<cmd>vsplit<cr>" },
  { "<C-w>-",     "<cmd>split<cr>" },
  { "gtt",        require("my.utils.markdown").toggle_checkbox,       { desc = "Add a checkbox, or toggle its status" } },
  { "<leader>L",  ":lua = ",                                          { desc = "Evaluate lua" } },
  { "[<Tab>",     ":tabp<CR>",                                        { desc = "Tab previous" } },
  { "]<Tab>",     ':tabn<CR>',                                        { desc = "Tab next" } },
  { "<leader>CE", "<cmd>e ~/.config/nvim<CR>",                        { desc = "View config dir" } },
  { "<leader>CP", "<cmd>e ~/.config/nvim/lua/my/plugin-config<CR>",   { desc = "Configure individual plugins" } },
  { "<leader>Ci", "<cmd>e ~/.config/nvim/init.lua<CR>",               { desc = "init.lua" } },
  { "<leader>Cc", "<cmd>e ~/.config/nvim/lua/my/colors.lua<CR>",      { desc = "colours" } },
  { "<leader>Cl", "<cmd>e ~/.config/nvim/lua/my/lsp<CR>",             { desc = "lsp" } },
  { "<leader>Cs", "<cmd>e ~/.config/nvim/lua/my/settings.lua<CR>",    { desc = "settings" } },
  { "<leader>Ck", "<cmd>e ~/.config/nvim/lua/my/keybindings.lua<CR>", { desc = "keymaps" } },
  { "<leader>Cp", "<cmd>e ~/.config/nvim/lua/my/plugins.lua<CR>",     { desc = "plugins" } },
  { "<leader>#",  ":buffer #<CR>",                                    { desc = "Alt buffer" } },
  { "<leader>Q",   ":copen<cr>",               { desc = "Toggle global quickfix" } },
  { "<leader>q",  ":lopen<cr>",                                       { desc = "Toggle local quickfix" } },
  { "<leader>wd", "<C-W>c",                                           { desc = "close window" } },
  { "<leader>ww", "<C-W>w",                                           { desc = "close window" } },
  { "<leader>w-", "<C-W>s",                                           { desc = "horizontal split" } },
  { "<leader>w|", "<C-W>v",                                           { desc = "vertical split" } },
  { "<leader>lR", vim.lsp.buf.rename,                                 { desc = "Rename" } },
  { "<leader>ld", vim.lsp.buf.definition,                             { desc = "Goto definition" } },
  { "gd",         vim.lsp.buf.definition,                             { desc = "Goto definition" } },
  { "<leader>lD", vim.lsp.buf.declaration,                            { desc = "Goto declaration" } },
  { "gD",         vim.lsp.buf.declaration,                            { desc = "Goto declaration" } },
  { "<leader>li", vim.lsp.buf.implementation,                         { desc = "Goto implementation" } },
  { "gi",         vim.lsp.buf.implementation,                         { desc = "Goto implementation" } },
  { "<leader>lr", vim.lsp.buf.references,                             { desc = "References to QF" } },
  { "<leader>lh", vim.lsp.buf.hover,                                  { desc = "hover" } },
  { "K",          vim.lsp.buf.hover,                                  { desc = "hover" } },
  { "<leader>lL", vim.diagnostic.setloclist,                          { desc = "Diagnostics to local qf" } },
  { "<leader>r",  ":%s/<C-r><C-w>/",                                  { desc = "Search and replace me" } },
}


-- Insert mode remaps
local insert = {
  { "<esc>",  "<cmd>noh<cr><esc>" }, -- esc also clears hlsearch
  -- Add undo points at convenient punctuation marks
  { ",",      ",<c-g>u" },
  { ".",      ".<c-g>u" },
  { ";",      ";<c-g>u" },
  { "<s-cr>", '<cr><esc>ko' },
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
  { "<leader>y", '"+y',     { desc = "Yank to clipboard" } },
  { "<leader>Y", '"+Y',     { desc = "Yank end of line to clipboard" } },
  { "<leader>d", '"+d',     { desc = "Cut to clipboard" } },
  { "<leader>p", '"+p',     { desc = "Paste from clipboard" } },
  { "<C-F>",     ":<C-F>a", { desc = "Edit command" } },
}

-- Set bindings
for _, bind in ipairs(insert) do
  map("i", unpack(bind))
end

for _, bind in ipairs(normal) do
  map("n", unpack(bind))
end

for _, bind in ipairs(visual) do
  map("v", unpack(bind))
end

for _, bind in ipairs(not_insert) do
  map("v", unpack(bind))
  map("n", unpack(bind))
end

-- make b an "inclusive" motion when used with an operator i.e. includes the starting letter
map("o", "b", "vb")


-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

vim.api.nvim_create_user_command("Q", "wqall", {})
