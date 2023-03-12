return {
  -- Needed to load first
  { 'lewis6991/impatient.nvim', priority = 100 },
  { 'nathom/filetype.nvim', priority = 100 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  -- Themes
  --{ 'sainnhe/everforest', priority = 100 },
  --{ 'marko-cerovac/material.nvim', priority = 100 },
  --{ 'Shatur/neovim-ayu', priority = 100 },
  --{ 'EdenEast/nightfox.nvim', priority = 100 },
  { 'rebelot/kanagawa.nvim', priority = 100 },

  -- statusline
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true } },

  -- Tmux integration
  { 'aserowy/tmux.nvim' },
  { 'christoomey/vim-tmux-navigator' },

  -- quality of life
  'AckslD/nvim-neoclip.lua',
  { 'echasnovski/mini.cursorword', config = function() require('mini.cursorword').setup() end, event = "CursorMoved" },
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
  { 'tiagovla/scope.nvim', config = function() require('scope').setup() end, event = "VeryLazy" },

  -- 'sudormrfbin/cheatsheet.nvim',
  { 'mbbill/undotree', event = 'VeryLazy' },
  { 'ThePrimeagen/harpoon', lazy = true },
  { 'drmingdrmer/vim-toggle-quickfix', lazy = true },


  -- surround
  { "kylechui/nvim-surround", event = "VeryLazy" },

  -- comments
  { 'numToStr/Comment.nvim', event = "VeryLazy" },

  -- tpope
  { 'tpope/vim-repeat', event = "VeryLazy" }, -- Integrates the repeat
  { 'tpope/vim-vinegar' }, -- Improves netrw



  -- motion
  { 'ggandor/leap.nvim' }, -- Use s to leap anywhere on the screen, similar to sneak
  { "LeonHeidelbach/trailblazer.nvim", lazy = true },

  -- text objects
  { "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end, },
  { 'echasnovski/mini.ai', event = "VeryLazy" }, -- Improves a and i text objects
  { 'echasnovski/mini.bracketed', event = "VeryLazy" }, -- Improves a and i text objects

  { 'folke/which-key.nvim', lazy = true },

  -- Telescope
  { 'nvim-telescope/telescope.nvim', dependencies = "tsakirist/telescope-lazy.nvim", event = 'VeryLazy' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- fzf lua
  { 'ibhagwan/fzf-lua' },
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },

  { "princejoogie/dir-telescope.nvim", dependencies = 'nvim-telescope/telescope.nvim' },
  -- integration with obsidian
  { 's-cassidy/obsidian.nvim' },
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
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = function()
    require("lsp_lines").setup()
  end },

  { 'nvim-treesitter/nvim-treesitter' }, -- build = ':TSUpdate' },
  { 'nvim-treesitter/playground', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'mrjones2014/nvim-ts-rainbow', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp', event = "InsertEnter" },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'dcampos/nvim-snippy', event = 'InsertEnter' },
  { 'honza/vim-snippets', event = 'InsertEnter' },
  { 'dcampos/cmp-snippy', event = 'InsertEnter' },
  { 'VonHeikemen/lsp-zero.nvim', event = 'VeryLazy' },

  -- Language-specific
  { 'AndrewRadev/tagalong.vim', ft = 'html' },

  -- testing
  --

  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",

  -- DAP

  { "mfussenegger/nvim-dap",
    lazy = true,
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
