return {
  -- Needed to load first
  { 'lewis6991/impatient.nvim', priority = 100 }, -- Packer can manage itself use { 'wbthomason/packer.nvim'}
  { 'nathom/filetype.nvim', priority = 100 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  -- Themes
  { 'sainnhe/everforest', priority = 100 },
  { 'marko-cerovac/material.nvim', priority = 100 },
  { 'Shatur/neovim-ayu', priority = 100 },
  { 'EdenEast/nightfox.nvim', priority = 100 },
  { 'rebelot/kanagawa.nvim', priority = 100 },

  -- statusline
  { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },

  -- Tmux integration
  { 'aserowy/tmux.nvim' },
  { 'christoomey/vim-tmux-navigator' },

  -- quality of life
  'AckslD/nvim-neoclip.lua',
  'echasnovski/mini.cursorword',
  -- 'sudormrfbin/cheatsheet.nvim',
  'mbbill/undotree',
  'ThePrimeagen/harpoon',
  'drmingdrmer/vim-toggle-quickfix',

  -- AI helper
  { 'aduros/ai.vim' },

  -- surround
  "kylechui/nvim-surround",

  -- comments
  { 'numToStr/Comment.nvim' },

  -- tpope
  { 'tpope/vim-repeat' }, -- Integrates the repeat
  { 'tpope/vim-vinegar' }, -- Improves netrw



  -- motion
  { 'ggandor/leap.nvim' }, -- Use s to leap anywhere on the screen, similar to sneak
  { 'ggandor/flit.nvim' }, -- Improves f and t

  -- text objects
  { "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end, },
  { 'echasnovski/mini.ai' }, -- Improves a and i text objects

  { 'folke/which-key.nvim' }, -- which-key in neovim

  -- Telescope
  { 'nvim-telescope/telescope.nvim', event = 'VeryLazy' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "benfowler/telescope-luasnip.nvim",
  },

  "princejoogie/dir-telescope.nvim",
  -- telescope.nvim is a required dependency
  'debugloop/telescope-undo.nvim',
  -- integration with obsidian
  { 'epwalsh/obsidian.nvim' },
  { 'gaoDean/autolist.nvim' },


  -- language support and completion

  -- LSP Support
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'mfussenegger/nvim-lint' },
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'windwp/nvim-ts-autotag',

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/playground',
  'mrjones2014/nvim-ts-rainbow',
  { 'nvim-treesitter/nvim-treesitter-context' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'L3MON4D3/LuaSnip', event = "VeryLazy" },
  { 'rafamadriz/friendly-snippets' },

  { 'VonHeikemen/lsp-zero.nvim' },

  -- Language-specific
  { 'AndrewRadev/tagalong.vim', ft = 'html' },

  -- testing
  --

  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",

  -- DAP

  { "mfussenegger/nvim-dap",
    lazy = true,
    event = "BufReadPre",
    dependencies = {
      { "Pocco81/DAPInstall.nvim", priority = 100 },
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      "jbyuki/one-small-step-for-vimkind"
    },
  }
}
