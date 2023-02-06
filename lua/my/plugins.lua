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
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true } },

  -- Tmux integration
  { 'aserowy/tmux.nvim' },
  { 'christoomey/vim-tmux-navigator' },

  -- quality of life
  'AckslD/nvim-neoclip.lua',
  'echasnovski/mini.cursorword',
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

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
  { "LeonHeidelbach/trailblazer.nvim" },

  -- text objects
  { "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end, },
  { 'echasnovski/mini.ai' }, -- Improves a and i text objects

  { 'folke/which-key.nvim' },

  -- Telescope
  { 'nvim-telescope/telescope.nvim', dependencies = "tsakirist/telescope-lazy.nvim", event = 'VeryLazy' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

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
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'dcampos/nvim-snippy', event = 'VeryLazy' },
  { 'honza/vim-snippets', event = 'VeryLazy' },
  { 'dcampos/cmp-snippy', event = 'VeryLazy' },
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
    event = "VeryLazy",
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
