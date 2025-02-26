return {
  -- Needed to load first
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  {
    'folke/which-key.nvim',
    config = function()
      require("my.plugin-config.which-key")
    end
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    priority = 1000,
    opts = {},
  },
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
      })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

  {
    'crispybaccoon/evergarden',
    opts = {
      transparent_background = true,
      contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
      overrides = {},           -- add custom overrides
    }
  },

  -- other themes I like
  --{"ellisonleao/gruvbox.nvim", priority = 100},
  --"folke/tokyonight.nvim",
  -- { 'sainnhe/everforest',    lazy = true, priority = 100 },
  -- { 'rebelot/kanagawa.nvim', lazy = true, priority = 100 },
  -- { 'Shatur/neovim-ayu',     lazy = true, priority = 100 },
  --{ 'EdenEast/nightfox.nvim', priority = 100 },

  -- tpope
  {
    'tpope/vim-repeat', -- Integrates the repeat operator with plugins
    event = "VeryLazy"
  },
  {
    'tpope/vim-fugitive',
    config = function()
      require("my.plugin-config.fugitive")
    end
  },


  -- my microblog plugin
  {
    's-cassidy/microblog.nvim',
    config = function()
      require("my.plugin-config.microblog")
    end
  },
  -- GIT
  --
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
    ,
  },

  -- FILE BROWSER
  {
    'stevearc/oil.nvim',
    config = function()
      require("my.plugin-config.oil")
    end
  },

  -- quality of life
  -- Lua
  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>Z", require("zen-mode").toggle)
      require("my.plugin-config.zenmode")
    end
  },
  {
    'AckslD/nvim-neoclip.lua', -- improves clipboard integration
    config = function()
      require('neoclip').setup()
    end
  },
  -- Lua
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('my.plugin-config.ufo')
    end
  },
  {
    "mateuszwieloch/automkdir.nvim"
  },
  {
    "chrisgrieser/nvim-puppeteer", -- automatically convert to f-string
    lazy = false,                  -- plugin lazy-loads itself. Can also load on filetypes.
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

  -- WRITING
  {
    'adamtajti/obsidian.nvim',
    branch = "blink-support",
    event = "VeryLazy",
    dependencies =
    { 'gaoDean/autolist.nvim' },
    config = function()
      require "my.plugin-config.obsidian"
    end
  },
  {
    "jalvesaq/zotcite",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("zotcite").setup({
        -- your options here (see doc/zotcite.txt)
      })
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
      require("my.plugin-config.rainbow-delimiters")
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
  {
    'brenoprata10/nvim-highlight-colors',
    config = function() require('nvim-highlight-colors').setup {} end
  },
  {
    "lervag/vimtex",
    lazy = true, -- we don't want to lazy load VimTeX
    ft = "tex",
    init = function()
      require("my.plugin-config.vimtex")
    end
  },

  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "folke/trouble.nvim",
    keys = require("my.plugin-config.trouble-keys"),
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require("my.plugin-config.null")
    end,
  },
  { 'ray-x/lsp_signature.nvim', event = "InsertEnter" },
  {
    'saghen/blink.cmp',
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        event = "InsertEnter",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
        config = function()
          require("my.plugin-config.luasnip")
        end
      }
    },
    opts = {
      snippets = { preset = 'luasnip' },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          snippets = {
            name = "Snippets",
            enabled = true,
            max_items = 8,
            min_keyword_length = 2,
            module = "blink.cmp.sources.snippets",
            score_offset = 85,
          },
        },
      },
      keymap = {
        preset = "none",
        ['<C-space>'] = { 'select_and_accept' },
        ['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },
    }
  },


  -- UI
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("my.plugin-config.lualine")
    end
  },



  -- Language-specific
  { 'AndrewRadev/tagalong.vim', ft = 'html' },

  {
    'MeanderingProgrammer/markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },


  -- QMK
  --
  {
    'codethread/qmk.nvim',
    config = function()
      require("my.plugin-config.qmk")
    end
  },



  -- MINI
  {
    'echasnovski/mini.ai', -- Improves a and i text objects
    event = "VeryLazy",
    config = function()
      require('mini.ai').setup()
    end
  },
  {
    'echasnovski/mini.surround', -- Surround stuff
    event = "VeryLazy",
    config = function()
      require('mini.surround').setup()
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
      wk.add({
        { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undotree" }
      })
    end
  },

  -- tmux integration
  -- { 'aserowy/tmux.nvim' },
  -- { 'christoomey/vim-tmux-navigator' },

  -- DAP

  {
    "mfussenegger/nvim-dap",
    lazy = true,
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
