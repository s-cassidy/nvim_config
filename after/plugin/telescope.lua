local actions = require "telescope.actions"
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
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
require("telescope").setup({
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("undo")
require('telescope').load_extension('fzf')
require('telescope').load_extension('luasnip')
require('telescope').load_extension('neoclip')
