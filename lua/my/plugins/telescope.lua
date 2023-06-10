return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = "tsakirist/telescope-lazy.nvim",
    config = function()
      require("my.plugins.config.telescope")
    end,
    event = 'VeryLazy'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  { "princejoogie/dir-telescope.nvim", dependencies = 'nvim-telescope/telescope.nvim' },
  { "Theo-Steiner/togglescope" }
}
