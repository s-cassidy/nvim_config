return {
  { 'nvim-treesitter/nvim-treesitter', config = function()
    require 'nvim-treesitter.configs'.setup {
      --ensure_installed = { "python", "lua", "rust", "typescript", "javascript",
      -- "markdown", "markdown_inline",
      -- "html", "css" },

      sync_install = false,
      auto_install = false,
      ignore_install = { "" },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },


      highlight = {
        enable = true,

        additional_vim_regex_highlighting = { "markdown" },
      },

      rainbow = {
        enable = false,
        extended_mode = true,
        max_file_lines = nil,
      },
    }
    require('nvim-ts-autotag').setup()
    local wk = require('which-key')
    wk.register({
      ["<leader>r"] = { ':TSToggle rainbow<CR>', 'Toggle Rainbow' }
    })
  end
  },
  { 'nvim-treesitter/playground', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'mrjones2014/nvim-ts-rainbow', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
}
