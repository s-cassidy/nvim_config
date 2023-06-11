return {

  -- Needed to load first
  { 'lewis6991/impatient.nvim',    priority = 100 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  { 'folke/which-key.nvim',        lazy = true },

  -- COLORSCHEME

  {
    "ellisonleao/gruvbox.nvim", priority = 100
  },

  -- other themes I like
  --{ 'sainnhe/everforest', priority = 100 },
  -- {'rebelot/kanagawa.nvim', priority = 100},
  --{ 'Shatur/neovim-ayu', priority = 100 },
  --{ 'EdenEast/nightfox.nvim', priority = 100 },

  -- SURROUND
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- COMMENTS
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },

  -- tpope
  {
    'tpope/vim-repeat', -- Integrates the repeat operator with plugins
    event = "VeryLazy"
  },
  {
    'tpope/vim-fugitive'
  },

  -- FILE BROWSERS
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
  {
    'AckslD/nvim-neoclip.lua', -- improves clipboard integration
    config = function()
      require('neoclip').setup()
    end
  },
  {
    'kevinhwang91/nvim-ufo', -- better folding
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require "my.plugin-config.ufo"
    end,
  },
  {
    'drmingdrmer/vim-toggle-quickfix', -- toggle the quickfix
    event = "VeryLazy"
  },

  -- TEXT OBJECTS
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },

  -- TELESCOPE
  {
    'nvim-telescope/telescope.nvim',
    dependencies = "tsakirist/telescope-lazy.nvim",
    config = function()
      require("my.plugin-config.telescope")
    end,
    event = 'VeryLazy'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  {
    "princejoogie/dir-telescope.nvim",
    dependencies = 'nvim-telescope/telescope.nvim'
  },
  {
    "Theo-Steiner/togglescope"
  },

  -- OBSIDIAN
  {
    's-cassidy/obsidian.nvim',
    dependencies =
    { 'gaoDean/autolist.nvim' },
    config = function()
      require "my.plugin-config.obsidian"
    end
  },

  -- TREESITTER
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require "my.plugin-config.treesitter"
    end
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'mrjones2014/nvim-ts-rainbow',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require "my.plugin-config.tstextobj"
    end
  },

  -- HARPOON
  {
    'ThePrimeagen/harpoon',
    config = function()
      require("my.plugin-config.harpoon")
    end
  },

  -- language support and completion
  { 'brenoprata10/nvim-highlight-colors', config = function() require('nvim-highlight-colors').setup {} end },

  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
      }
    },
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'mfussenegger/nvim-lint' },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("my.plugin-config.null")
    end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } },
    config = function()
      require('which-key').register({ ["<leader>n"] = { ":Navbuddy<cr>", "Symbols" } })
    end
  },
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      require "my.plugin-config.prettier"
    end
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end
  },
  { 'ray-x/lsp_signature.nvim',  event = "InsertEnter" },

  -- Autocompletion
  { 'VonHeikemen/lsp-zero.nvim', event = 'VeryLazy' },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'dcampos/cmp-snippy',  event = 'InsertEnter' },
    },
    config = function()
      require "my.plugin-config.cmp"
    end
  },

  -- SNIPPETS
  {
    'dcampos/nvim-snippy',
    config = function()
      require "my.plugin-config.snippy"
    end,
    event = 'InsertEnter'
  },
  { 'honza/vim-snippets',       event = 'InsertEnter' },

  -- Language-specific
  { 'AndrewRadev/tagalong.vim', ft = 'html' },



  -- testing
  --

  {
    "nvim-neotest/neotest",
    config = function()
      require "my.plugin-config.neotest"
    end,
    event = "VeryLazy",
  },
  "nvim-neotest/neotest-python",

  -- STATUS LINES

  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  --   config = function()
  --     require("my.plugin-config.lualine")
  --   end
  -- },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("my.plugin-config.statuscol")
    end
  },
  {
    'nanozuki/tabby.nvim',
    config = function()
      require("my.plugin-config.tabby")
    end
  },

  -- MINI
  {
    'echasnovski/mini.cursorword', -- underline occurrences of word under cursor
    config = function()
      require('mini.cursorword').setup()
    end,
    event = "CursorMoved"
  },
  {
    'echasnovski/mini.ai', -- Improves a and i text objects
    event = "VeryLazy",
    config = function()
      require('mini.ai').setup()
    end
  },
  {
    'echasnovski/mini.bracketed', -- lots of [ ] pair commands
    event = "VeryLazy",
    config = function()
      require('mini.bracketed').setup()
    end
  },
  {
    'echasnovski/mini.splitjoin',
    event = "VeryLazy",
    config = function()
      require('mini.splitjoin').setup()
    end
  }, -- join and split things
  {
    'echasnovski/mini.colors',
    event = "VeryLazy",
    config = function()
      require('mini.colors').setup()
    end
  }, -- join and split things

  -- UTILITIES
  {
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>u"] = { vim.cmd.UndotreeToggle, "Undotree" }
      })
    end
  },

  -- tmux integration
  { 'aserowy/tmux.nvim' },
  { 'christoomey/vim-tmux-navigator' },

  -- DAP

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      { "Pocco81/DAPInstall.nvim", priority = 100 },
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      "jbyuki/one-small-step-for-vimkind"
    },
    config = function()
      require('my.dap.init').setup()
    end
  }
}
