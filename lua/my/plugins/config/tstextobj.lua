require 'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      selection_modes = {
        ['@parameter.outer'] = 'v',       -- charwise
        ['@function.outer'] = 'V',        -- linewise
        ['@function.inner'] = 'V',        -- linewise
        ['@class.inner'] = 'V',           -- linewise
        ['@class.outer'] = 'V',           -- linewise
      },

    }
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>j"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>k"] = "@parameter.inner",
    },
  },
}
