return {
  -- Needed to load first
  { 'lewis6991/impatient.nvim',    priority = 100 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  { 'folke/which-key.nvim',        lazy = true },

  -- surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require(
        "nvim-surround").setup()
    end
  },

  -- comments
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require(
        'Comment').setup()
    end
  },

  -- tpope
  { 'tpope/vim-repeat',  event = "VeryLazy" }, -- Integrates the repeat
  { 'tpope/vim-fugitive' },


  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-h>"] = false }
      })
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
  },

  -- quality of life
  { 'AckslD/nvim-neoclip.lua',         config = function() require('neoclip').setup() end }, -- improves clipboard integration
  { 'kevinhwang91/nvim-ufo',           dependencies = 'kevinhwang91/promise-async' },        -- better folding

  { 'drmingdrmer/vim-toggle-quickfix', event = "VeryLazy" },                                 -- toggle the quickfix
}
