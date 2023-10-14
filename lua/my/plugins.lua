return {
  -- Needed to load first
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  { 'folke/which-key.nvim',        lazy = true },

  -- COLORSCHEME

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- other themes I like
  --{"ellisonleao/gruvbox.nvim", priority = 100},
  --"folke/tokyonight.nvim",
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

  -- FILE BROWSER
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
    'shadyalfred/electric-quotes.nvim',
    dependencies = {
      'uga-rosa/utf8.nvim',
    },
    cmd = 'ElectricQuotesToggle',
  },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = true, -- show highlights only after keypress
        dim = false              -- dim all other characters if set to true (recommended!)
      }
    end
  },
  {
    "chrisgrieser/nvim-early-retirement",
    -- config = true,
    event = "VeryLazy",
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
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require "my.plugin-config.rainbow"
    end
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
  -- { 'mfussenegger/nvim-lint' },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("my.plugin-config.null")
    end,
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
      -- { 'saadparwaiz1/cmp_luasnip' },
      -- {
      --   "L3MON4D3/LuaSnip",
      --   -- follow latest release.
      --   version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      --   -- install jsregexp (optional!).
      --   build = "make install_jsregexp",
      --   event = "InsertEnter",
      --   config = function()
      --     require "my.plugin-config.luasnip"
      --   end
      -- },
      { 'dcampos/cmp-snippy',  event = 'InsertEnter' },
    },
    config = function()
      require "my.plugin-config.cmp"
    end
  },

  -- SNIPPETS
  { 'honza/vim-snippets',       event = 'InsertEnter' },
  {
    'dcampos/nvim-snippy',
    config = function()
      require "my.plugin-config.snippy"
    end,
    event = 'InsertEnter'
  },

  -- Language-specific
  { 'AndrewRadev/tagalong.vim', ft = 'html' },


  -- QMK
  --
  {
    'codethread/qmk.nvim',
    config = function()
      ---@type qmk.UserConfig
      local conf = {
        name = 'LAYOUT_planck_grid',
        comment_preview = {
          keymap_overrides = {
            HERE_BE_A_LONG_KEY = 'Magic', -- replace any long key codes
          }
        },
        layout = {
          '_ x x x x x x _ x x x x x x',
          '_ x x x x x x _ x x x x x x',
          '_ x x x x x x _ x x x x x x',
          '_ x x x x x x _ x x x x x x',
        }
      }
      require('qmk').setup(conf)
    end
  },


  -- STATUS LINES

  -- {
  --   "luukvbaal/statuscol.nvim",
  --   config = function()
  --     require("my.plugin-config.statuscol")
  --   end
  -- },

  -- MINI
  {
    'echasnovski/mini.ai', -- Improves a and i text objects
    event = "VeryLazy",
    config = function()
      require('mini.ai').setup()
    end
  },
  -- {
  --   'echasnovski/mini.animate', -- Animate stuff
  --   event = "VeryLazy",
  --   config = function()
  --     require('mini.animate').setup({
  --       cursor = {
  --         timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
  --       },
  --       scroll = {
  --         enable = false
  --       }
  --     })
  --   end
  -- },
  {
    'echasnovski/mini.pairs', -- pair brackets etc
    event = "VeryLazy",
    config = function()
      require('my.plugin-config.minipairs')
    end
  },
  {
    'echasnovski/mini.align', -- Align columns of text
    event = "VeryLazy",
    config = function()
      require('mini.align').setup()
    end
  },
  {
    'echasnovski/mini.bracketed', -- lots of [ ] pair commands
    event = "VeryLazy",
    config = function()
      require('mini.bracketed').setup({
        file = { suffix = '', options = {} },
      })
    end
  },
  {
    'echasnovski/mini.splitjoin', -- join and split things
    event = "VeryLazy",
    config = function()
      require('mini.splitjoin').setup()
    end
  },

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
