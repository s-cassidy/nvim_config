return {
  -- text objects
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },


  -- language support and completion
  { 'brenoprata10/nvim-highlight-colors', config = function() require('nvim-highlight-colors').setup {} end },

  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      }
    },
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'mfussenegger/nvim-lint' },
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  { 'windwp/nvim-ts-autotag',                  config = function() require('nvim-ts-autotag').setup() end },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end
  },
  { 'ray-x/lsp_signature.nvim',                event = "InsertEnter" },
  { 'nvim-treesitter/nvim-treesitter' }, -- build = ':TSUpdate' },
  { 'nvim-treesitter/playground',              dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'mrjones2014/nvim-ts-rainbow',             dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp',                        event = "InsertEnter" },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'dcampos/nvim-snippy',                     event = 'InsertEnter' },
  { 'honza/vim-snippets',                      event = 'InsertEnter' },
  { 'dcampos/cmp-snippy',                      event = 'InsertEnter' },
  { 'VonHeikemen/lsp-zero.nvim',               event = 'VeryLazy' },

  -- Language-specific
  --{ 'AndrewRadev/tagalong.vim', ft = 'html' },

  -- testing
  --

  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",

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
  }
}
