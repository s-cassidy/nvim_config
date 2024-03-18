require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "python",
    "lua",
    "typescript",
    "javascript",
    "markdown",
    "markdown_inline",
    "html",
    "css",
    "vim",
    "vimdoc"
  },

  sync_install = false,
  auto_install = false,
  ignore_install = { "" },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<A-v>",
      node_incremental = "<A-v>",
      scope_incremental = false,
      node_decremental = "<A-d>",
    },
  },
  indent = {
    enable = true
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
    disable = { "vimdoc" }
  },

  autotag = {
    enable = true,
  },


}
