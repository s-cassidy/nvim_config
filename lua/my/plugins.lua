return {
  -- Needed to load first
  { 'nvim-lua/plenary.nvim' },
  -- { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = true,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      --     vim.g.zenbones_darken_comments = 45
      vim.cmd.colorscheme('rosebones')

    end
  },
  {'rose-pine/neovim', name="rose-pine", lazy=true, priority = 100},
  -- other themes I like
  --{"ellisonleao/gruvbox.nvim", priority = 100},
  --"folke/tokyonight.nvim",
  -- { 'sainnhe/everforest',    lazy = true, priority = 100 },
  -- { 'rebelot/kanagawa.nvim', lazy = true, priority = 100 },
  -- { 'Shatur/neovim-ayu',     lazy = true, priority = 100 },
  --{ 'EdenEast/nightfox.nvim', priority = 100 },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    'tpope/vim-fugitive',
    config = function()
      require("my.plugin-config.fugitive")
    end
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
  {"ten3roberts/qf.nvim",
    opts = {}
  },
  -- {
  --   'altermo/ultimate-autopair.nvim',
  --   event = { 'InsertEnter', 'CmdlineEnter' },
  --   branch = 'v0.6', --recommended as each new version will have breaking changes
  --   config = function()
  --     require('ultimate-autopair').setup({
  --       { '“', '”', ft = { "markdown" }, multiline = false },
  --       { '$', '$', ft = { "markdown" }, multiline = false },
  --       close = {
  --         enable = true,
  --         map = '<A-c>',  --string or table
  --         cmap = '<A-c>', --string or table
  --       },
  --     })
  --   end
  -- },
  {  'rstacruz/vim-closer' },
  {
    'windwp/nvim-ts-autotag',
    ft = { "html", "markdown" },
    opts = {
      opts = {
        -- Defaults
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
    }
  },
  {
    'AckslD/nvim-neoclip.lua', -- improves clipboard integration
    config = function()
      require('neoclip').setup()
    end
  },
  -- Lua
  {
    "mateuszwieloch/automkdir.nvim",
    event = "VeryLazy"
  },
  {
    'jinh0/eyeliner.nvim',
    keys = {"f", "F"},
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = true, -- show highlights only after keypress
        dim = false              -- dim all other characters if set to true (recommended!)
      }
    end
  },
  {
    "kshenoy/vim-signature",
    event = "VeryLazy",
  },

  -- SNACKS
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require("my.plugin-config.snacks").opts,
    keys = require("my.plugin-config.snacks").keys,
    init = require("my.plugin-config.snacks").init,
  },

  -- WRITING
  {
    'obsidian-nvim/obsidian.nvim',
    event = { "BufRead */home/sam/notes/*",
    },
    dependencies =
      { 'MeanderingProgrammer/render-markdown.nvim' },
    config = function()
      require "my.plugin-config.obsidian"
    end
  },
  -- TREESITTER
  {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    config = function()
      require "my.plugin-config.treesitter"
    end
  },
  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require("my.plugin-config.rainbow-delimiters")
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = "VeryLazy",
    config = function()
      require "my.plugin-config.tstextobj"
    end
  },

  {
    'stevearc/aerial.nvim',
    event = "VeryLazy",
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("aerial").setup(
        {
          backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" }
        }
      )
      vim.keymap.set("n", "<leader>n" ,":AerialToggle<CR>", {desc = "Navigate document"})
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
    ft = "css",
    config = function() require('nvim-highlight-colors').setup {} end
  },
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      require("my.plugin-config.vimtex")
    end
  },

  -- LSP Support
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  {
    'nvimtools/none-ls.nvim',
    event = "VeryLazy",
    config = function()
      require("my.plugin-config.null")
    end,
  },
  { 'ray-x/lsp_signature.nvim', event = "InsertEnter" },
  {
    'saghen/blink.cmp',
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    version = '1.*',
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        event = "InsertEnter",
        dependencies = {
          {"rafamadriz/friendly-snippets",
            version = false,
            pin = true
          },
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
        default = { 'lsp', 'path', 'snippets' },
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
        ['<tab>'] = { 'select_next', 'fallback' },
        ['<S-tab>'] = { 'select_prev', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },
    }
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
        { "<leader>U", vim.cmd.UndotreeToggle, desc = "Undotree" }
      })
    end
  },

  -- tmux integration
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<A-h>",  function() vim.cmd "TmuxNavigateLeft" end },
      { "<A-j>",  function() vim.cmd "TmuxNavigateDown" end },
      { "<A-k>",  function() vim.cmd "TmuxNavigateUp" end },
      { "<A-l>",  function() vim.cmd "TmuxNavigateRight" end },
      { "<A-\\>", function() vim.cmd "TmuxNavigatePrevious" end },
    },
  },

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
