local actions = require "telescope.actions"
local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { width = 0.5 },
    mappings = {
      n = {
        ["<leader>q"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<leader>Q"] = actions.smart_add_to_qflist + actions.open_qflist,
        ["<M-->"] = actions.select_horizontal,
        ["<M-/>"] = actions.select_vertical,
      },
      i =  {
        ["<A-->"] = actions.select_horizontal,
        ["<A-/>"] = actions.select_vertical,
      }
    },
  },

  fzf = {
    fuzzy = true,                   -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true,    -- override the file sorter
    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    -- the default case_mode is "smart_case"
  },
  lazy = {
    -- Optional theme (the extension doesn't set a default theme)
    theme = "ivy",
    -- Whether or not to show the icon in the first column
    show_icon = true,
    -- Mappings for the actions
    mappings = {
      open_in_browser = "<C-o>",
      open_in_file_browser = "<M-b>",
      open_in_find_files = "<C-f>",
      open_in_live_grep = "<C-g>",
      open_plugins_picker = "<C-b>", -- Works only after having called first another action
      open_lazy_root_find_files = "<C-r>f",
      open_lazy_root_live_grep = "<C-r>g",
    },
    -- Other telescope configuration options
  },
}
require("telescope").load_extension "lazy"
require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')

local is_inside_work_tree = {}

local project_files = function()
  local opts = {} -- define here if you want to define something

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end


local function live_grep_git_dir()
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel",
    vim.fn.expand("%:p:h")))
  git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
  local opts = { cwd = git_dir, }
  require('telescope.builtin').live_grep(opts)
end

require("telescope").load_extension("dir")
require("dir-telescope").setup({
  hidden = false,
  no_ignore = true,
})


-- set bindings
local binds = {
  { '<leader>fz',  project_files,                                                { desc = "Find files" } },
  { '<C-p>',       project_files,                                                { desc = "Find files" } },
  { '<leader>fg',  live_grep_git_dir,                                            { desc = "grep project files" } },
  { '<C-g>',       live_grep_git_dir,                                            { desc = "grep project files" } },
  { '<leader>fG',  builtin.live_grep,                                            { desc = "grep cwd" } },
  { '<leader>fy',  ":Telescope neoclip<cr>",                                     { desc = "yanks clipboard" } },
  { '<leader>fp',  ":Telescope lazy<cr>",                                        { desc = "Plugins" } },
  { '<leader>fk',  ":Telescope keymaps<cr>",                                     { desc = "Plugins" } },
  { '<leader>fb',  builtin.buffers,                                              { desc = "Current buffers" } },
  { '<leader>b',   builtin.buffers,                                              { desc = "Current buffers" } },
  { '<leader>fd',  function() builtin.diagnostics({ bufnr = 0 }) end,            { desc = "Diagnostics" } },
  { '<leader>fo',  builtin.oldfiles,                                             { desc = "History" } },
  { '<leader>fh',  builtin.help_tags,                                            { desc = "Help tags" } },
  { '<leader>fu',  ":lua require('telescope').extensions.undo.undo()<cr><esc>k", { desc = "View undo tree" } },
  { "<leader>fff", ':Telescope dir find_files',                                  { desc = 'Find files' } },
  { "<leader>ffg", ':Telescope dir live_grep',                                   { desc = 'grep' } },
}

for _, bind in ipairs(binds) do
  vim.keymap.set("n", unpack(bind))
end
