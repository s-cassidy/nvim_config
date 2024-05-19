return {
  -- Needed to load first
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  {
    'folke/which-key.nvim',
    lazy = true,
  },

  -- COLORSCHEME
  {
    'andrew-george/telescope-themes',
    config = function()
      require('telescope').load_extension('themes')
    end
  },


  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
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

  { "catppuccin/nvim",       lazy = true, name = "catppuccin", priority = 1000 },

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
  { 'sainnhe/everforest',    lazy = true, priority = 100 },
  { 'rebelot/kanagawa.nvim', lazy = true, priority = 100 },
  { 'Shatur/neovim-ayu',     lazy = true, priority = 100 },
  --{ 'EdenEast/nightfox.nvim', priority = 100 },


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
    'tpope/vim-fugitive',
    config = function()
      require("my.plugin-config.fugitive")
    end
  },


  -- my microblog plugin
  {
    's-cassidy/microblog.nvim',
    config = function()
      require('microblog').setup(
        {
          blogs = {
            {
              url = "https://samjc.me",
              uid = "https://samjc.micro.blog"
            },
            {
              url = "https://samjc-test.micro.blog",
              uid = "https://samjc-test.micro.blog"
            }
          },
          no_save_quickpost = true,
        }
      )
      vim.keymap.set({ "n", "v" }, "<leader>me", require("microblog").pick_post, { desc = "Edit a post" })
      vim.keymap.set({ "n", "v" }, "<leader>mp", require("microblog").publish, { desc = "Send a post" })
      vim.keymap.set({ "n", "v" }, "<leader>mq", require("microblog").quickpost, { desc = "Quick post" })
      vim.keymap.set({ "n", "v" }, "<leader>mu", require("microblog").get_post_from_url, { desc = "Open micro.blog url" })
      vim.keymap.set({ "n", "v" }, "<leader>ms", require("microblog").display_post_status,
        { desc = "Display post status" })
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
      require("oil").setup({
        keymaps = {
          ["<C-h>"] = false,
          ["<C-p>"] = false,
          ["<C-S-p>"] = "actions.preview"
        }
      })
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   event = "VeryLazy",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  --   config = function()
  --     require("neo-tree").setup(
  --       {
  --         filesystem = {
  --           window = {
  --             mappings = {
  --               ["-"] = "navigate_up",
  --             }
  --           }
  --         }
  --       }
  --     )
  --     vim.keymap.set("n", "_", ":Neotree left<CR>", { desc = "Open filetree" })
  --   end
  -- },

  -- quality of life
  {
    'AckslD/nvim-neoclip.lua', -- improves clipboard integration
    config = function()
      require('neoclip').setup()
    end
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      require("zen-mode").setup({
        on_open = function()
          vim.o.cmdheight = 1
        end,
        on_close = function()
          vim.o.cmdheight = 0
        end,
      })
    end
  },
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

  -- OBSIDIAN
  {
    'epwalsh/obsidian.nvim',
    -- keys = "<leader>v",
    dependencies =
    { 'gaoDean/autolist.nvim' },
    config = function()
      require "my.plugin-config.obsidian"
    end
  },
  {
    'arnarg/todotxt.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      require('todotxt-nvim').setup({
        todo_file = "~/notes/todo/todo.txt",
      })
      require "my.plugin-config.todotxt"
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
      require('rainbow-delimiters.setup').setup(
        {
          highlight = {
            'RainbowDelimiterViolet',
            'RainbowDelimiterBlue',
            'RainbowDelimiterCyan',
            'RainbowDelimiterGreen',
            'RainbowDelimiterOrange',
            'RainbowDelimiterYellow',
            'RainbowDelimiterRed',
          },
        }
      )
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
      { 'williamboman/mason.nvim' },
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    config = false,
    dependencies = {
      "nvim-lspconfig" }
  },
  { "folke/neodev.nvim",                  opts = {} },
  {
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    keys = {
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },
  -- { 'mfussenegger/nvim-lint' },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require("my.plugin-config.null")
    end,
  },
  -- {
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --   config = function()
  --     require("lsp_lines").setup()
  --     vim.diagnostic.config({ virtual_text = false, })
  --     vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
  --   end
  -- },
  { 'ray-x/lsp_signature.nvim', event = "InsertEnter" },

  -- Autocompletion
  -- { 'VonHeikemen/lsp-zero.nvim', event = 'VeryLazy' },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      { "rafamadriz/friendly-snippets" },
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        event = "InsertEnter",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        keys = {
          {
            "<tab>",
            function()
              return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
          },
          { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
          { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
        config = function()
          require "my.plugin-config.luasnip"
        end
      },
      -- { 'dcampos/cmp-snippy', event = 'InsertEnter' },
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


  -- UI
  --
  -- lazy.nvim
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("noice").setup({
  --       routes = {
  --         {
  --           filter = {
  --             event = "msg_show",
  --             kind = "search_count",
  --           },
  --           opts = { skip = true },
  --         },
  --       },
  --       views = {
  --         cmdline_popup = {
  --           position = {
  --             row = 5,
  --             col = "50%",
  --           },
  --           size = {
  --             width = 60,
  --             height = "auto",
  --           },
  --         },
  --         popupmenu = {
  --           relative = "editor",
  --           position = {
  --             row = 8,
  --             col = "50%",
  --           },
  --           size = {
  --             width = 60,
  --             height = 10,
  --           },
  --           border = {
  --             style = "rounded",
  --             padding = { 0, 1 },
  --           },
  --           win_options = {
  --             winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
  --           },
  --         },
  --       },
  --       messages = {
  --         -- NOTE: If you enable messages, then the cmdline is enabled automatically.
  --         -- This is a current Neovim limitation.
  --         enabled = true,              -- enables the Noice messages UI
  --         view = "mini",               -- default view for messages
  --         view_error = "mini",         -- view for errors
  --         view_warn = "mini",          -- view for warnings
  --         view_history = "messages",   -- view for :messages
  --         view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  --       },
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --         message = {
  --           -- Messages shown by lsp servers
  --           enabled = true,
  --           view = "mini",
  --           opts = {},
  --         },
  --         signature = { enabled = false }
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true,         -- use a classic bottom cmdline for search
  --         command_palette = true,       -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false,           -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false,       -- add a border to hover docs and signature help
  --       },
  --     }
  --     )
  --   end,
  --   opts = {
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  -- {
  --   "stevearc/dressing.nvim",
  --   lazy = true,
  --   init = function()
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     vim.ui.select = function(...)
  --       require("lazy").load({ plugins = { "dressing.nvim" } })
  --       return vim.ui.select(...)
  --     end
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     vim.ui.input = function(...)
  --       require("lazy").load({ plugins = { "dressing.nvim" } })
  --       return vim.ui.input(...)
  --     end
  --   end,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("my.plugin-config.lualine")
    end
  },



  -- Language-specific
  { 'AndrewRadev/tagalong.vim',      ft = 'html' },

  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({})
    end,
  },


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
  {
    'echasnovski/mini.surround', -- Improves a and i text objects
    event = "VeryLazy",
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    'echasnovski/mini.animate', -- Animate stuff
    event = "VeryLazy",
    config = function()
      require('mini.animate').setup({
        cursor = {
          timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
        },
        scroll = {
          enable = false
        }
      })
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
