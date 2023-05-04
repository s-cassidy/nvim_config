return {
  { 'nvim-telescope/telescope.nvim',            dependencies = "tsakirist/telescope-lazy.nvim", event = 'VeryLazy' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  { "princejoogie/dir-telescope.nvim", dependencies = 'nvim-telescope/telescope.nvim' },
}
