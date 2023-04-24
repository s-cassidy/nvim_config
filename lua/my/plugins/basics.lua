return {
  -- Needed to load first
  { 'lewis6991/impatient.nvim', priority = 100 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  { 'folke/which-key.nvim', lazy = true },

  -- surround
  { "kylechui/nvim-surround", event = "VeryLazy", config = function() require("nvim-surround").setup() end },

  -- comments
  { 'numToStr/Comment.nvim', event = "VeryLazy", config = function() require('Comment').setup() end },

  -- tpope
  { 'tpope/vim-repeat', event = "VeryLazy" }, -- Integrates the repeat
  { 'tpope/vim-vinegar' }, -- Improves netrw
  { 'tpope/vim-fugitive' },

  -- quality of life
  { 'AckslD/nvim-neoclip.lua', config = function() require('neoclip').setup() end }, -- improves clipboard integration
  -- { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }, -- better folding
  { 'tiagovla/scope.nvim', config = function() require('scope').setup() end, event = "VeryLazy" }, -- buffers are local to tabs

  { 'drmingdrmer/vim-toggle-quickfix', event = VeryLazy }, -- toggle the quickfix
}
