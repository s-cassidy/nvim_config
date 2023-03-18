local map = vim.keymap.set

-- Normal Mode Remaps
local normal = {
  { "<C-s-D>", ":bd<cr>", { silent = true } }, -- delete current buffer
  { "<C-s-t>", ":ObsidianTemplate<cr>", { silent = true } },
  { "<S-l>", ":bn<cr>", { silent = true } }, -- next buffer
  { "<S-h>", ":bp<cr>", { silent = true } }, -- previous buffer
  { "j", "v:count ? 'j' : 'gj'", { silent = true, expr = true } }, -- j goes down by visual lines, unless a count is provided
  { "k", "v:count ? 'k' : 'gk'", { silent = true, expr = true } }, -- k goes up by visual lines, unless a count is provided
  { "<leader>J", "mzJ`z", { desc = "Append line below" } }, -- append line below to current line without moving cursor
  { "n", "nzzzv" },
  { "N", "Nzzzv" }, -- cursor stays centered when searching
  { "<C-u>", "<C-u>zz" }, -- moving up/down keep cursor centered -- less disorientating
  { "<C-d>", "<C-d>zz" }, -- moving up/down keep cursor centered -- less disorientating
  { "d ", "dd" }, -- faster/more comfortable than double jumping?
  { "y ", "yy" }, -- faster/more comfortable than double jumping?
  { "<C-Up>", "<cmd>resize +2<cr>" }, -- resize windows with ctrl + arrows
  { "<C-Down>", "<cmd>resize -2<cr>" },
  { "<C-Left>", "<cmd>vertica resize -2<cr>" },
  { "<C-Right>", "<cmd>vertica resize +2<cr>" },
  { "<esc>", "<cmd>noh<cr><esc>" } -- esc also clears hlsearch
}


-- Insert mode remaps
local insert = {
  { "<A-l>", "<C-o>l", { silent } }, -- four mappings so that alt+hjkl moves cursor in insert
  { "<A-k>", "<C-o>k", { silent } },
  { "<A-j>", "<C-o>j", { silent } },
  { "<A-h>", "<C-o>h", { silent } },
  { "<esc>", "<cmd>noh<cr><esc>" }, -- esc also clears hlsearch
  { ",", ",<c-g>u" },
  { ".", ".<c-g>u" },
  { ";", ";<c-g>u" },
}

-- Visual mode remaps
local visual = {
  { "J", ":m '>+1<CR>gv=gv", { silent } },
  { "K", ":m '<-2<CR>gv=gv", { silent } },
  { "<leader>P", '"_dP' }, -- paste over selection without adding pasted-over text to the register
  { "<", "<gv" }, -- better indents
  { ">", ">gv" },
}

-- all modes
local not_insert = {
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

wk.register({
  ["[<Tab>"] = { ":tabp<CR>", "Tab previous" },
  ["]<Tab>"] = { ':tabn<CR>', "Tab next" },
}
) -- previous tab

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

local def = { vim.lsp.buf.definition, "Goto definition" }
local dec = { vim.lsp.buf.declaration, "Goto declaration" }
local imp = { vim.lsp.buf.implementation, "Goto implementation" }
local hov = { vim.lsp.buf.hover, "hover" }
-- LSP binds
wk.register({
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
  ["<leader>lL"] = { vim.diagnostic.setloclist, "Diagnostics to local qf" }
}, { buffer = bufnr })


wk.register({ ["<leader>"] = {
  y = { '"+y', "Yank to clipboard" },
  Y = { '"+Y', "Yank to clipboard" },
  d = { '"+d', "Cut to clipboard" },
  ["<C-d>"] = { '"_d', "True delete" },
  p = { '"+p', "Paste from clipboard" },
} })

wk.register({ ["<leader>"] = {
  y = { '"+y', "Yank to clipboard" },
  d = { '"+d', "Cut to clipboard" },
  p = { '"+p', "Paste from clipboard" },
  ["<C-d>"] = { '"_d', "True delete" },
  P = { '"+P', "Paste over and keep" }
} }, { mode = "v" })


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
  ['<leader>fg'] = { ":lua live_grep_git_dir()<CR>", "grep project files" },
  ['<leader>fG'] = { builtin.live_grep, "grep cwd" },
  ['<leader>fy'] = { ":Telescope neoclip<cr>", "yanks clipboard" },
  ['<leader>fp'] = { ":Telescope lazy<cr>", "Plugins" },
  ['<leader>fb'] = { builtin.buffers, "Current buffers" },
  ['<leader>b'] = { builtin.buffers, "Current buffers" },
  ['<leader>fD'] = { builtin.diagnostics, "Diagnostics" },
  ['<leader>fo'] = { builtin.oldfiles, "History" },
  ['<leader>fh'] = { builtin.help_tags, "Help tags" },
  ['<leader>fu'] = { ":lua require('telescope').extensions.undo.undo()<cr><esc>k", "View undo tree" }
})

wk.register({
  ["<leader>v"] = { name = "+obsidian" },
  ["<leader>vv"] = { ":tabe ~/notes/wiki<cr>:tcd ~/notes/wiki<cr>",
    "Go to vault" },
  ["<leader>vt"] = { ":ObsidianTemplate<cr>", "Insert template" },
  ["<leader>vn"] = { ":ObsidianNew ", "New note" },
  ["<leader>vs"] = { ":ObsidianSearch<cr>", "Search" },
  ["<leader>vo"] = { ":ObsidianSearch<cr>", "Open note" },

})

wk.register({
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
