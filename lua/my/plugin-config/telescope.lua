local actions = require "telescope.actions"
local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 10,
      prompt_position = 'bottom'
    },
  },
  mappings = {
    n = {
      ["<leader>q"] = actions.smart_send_to_qflist + actions.open_qflist,
      ["<leader>Q"] = actions.smart_add_to_qflist + actions.open_qflist
    }
  },
  extensions = {
    togglescope = {
      ["find_files"] = {
        ['<C-x>'] = {
          hidden = true,
          no_ignore = true,
        }
      }
    }
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

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('luasnip')
require('telescope').load_extension('neoclip')

function live_grep_git_dir()
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel",
    vim.fn.expand("%:p:h")))
  git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
  local opts = { cwd = git_dir, }
  require('telescope.builtin').live_grep(opts)
end

require("telescope").load_extension("dir")
require("dir-telescope").setup({
  hidden = true,
  respect_gitignore = true,
})


-- set bindings
local binds = {
  { "<leader>F",   ":Telescope file_browser path=%:p:h select_buffer=true<cr>",  { desc = "Browser" } },
  { '<leader>fz',  builtin.find_files,                                           { desc = "Find files" } },
  { '<C-p>',       builtin.find_files,                                           { desc = "Find files" } },
  { '<leader>fg',  ":lua live_grep_git_dir()<CR>",                               { desc = "grep project files" } },
  { '<C-g>',       ":lua live_grep_git_dir()<CR>",                               { desc = "grep project files" } },
  { '<leader>fG',  builtin.live_grep,                                            { desc = "grep cwd" } },
  { '<leader>fy',  ":Telescope neoclip<cr>",                                     { desc = "yanks clipboard" } },
  { '<leader>fp',  ":Telescope lazy<cr>",                                        { desc = "Plugins" } },
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
