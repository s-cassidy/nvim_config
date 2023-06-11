require 'nvim-treesitter.configs'.setup {
  -- ensure_installed = { "python", "lua", "rust", "typescript", "javascript",
  --   "markdown", "markdown_inline",
  --   "html", "css" },

  sync_install = false,
  auto_install = false,
  ignore_install = { "" },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<A-CR>",
      node_incremental = "<A-CR>",
      scope_incremental = "<A-S-CR>",
      node_decremental = "<A-BS>",
    },
  },
  indent = {
    enable = true
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },

  autotag = {
    enable = true,
  },


  rainbow = {
    enable = false,
    extended_mode = true,
    max_file_lines = nil,
  },
}



local wk = require('which-key')
wk.register({
  ["<leader>r"] = { ':TSToggle rainbow<CR>', 'Toggle Rainbow' }
})
