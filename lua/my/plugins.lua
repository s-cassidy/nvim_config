return {
-- Needed to load first
    { 'lewis6991/impatient.nvim' }, -- Packer can manage itself use { 'wbthomason/packer.nvim'} 
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'kyazdani42/nvim-web-devicons' },

    -- Themes
    { 'sainnhe/everforest', priority=100 },
    { 'Shatur/neovim-ayu', priority=100 },
    { 'EdenEast/nightfox.nvim' priority=100},

    -- statusline
    { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }},

    -- Tmux integration
    { 'aserowy/tmux.nvim' },
    {  'christoomey/vim-tmux-navigator' },

    -- quality of life
    'echasnovski/mini.cursorword',
    'sudormrfbin/cheatsheet.nvim',
    'mbbill/undotree',
    'ThePrimeagen/harpoon',
    'drmingdrmer/vim-toggle-quickfix',

    -- AI helper
    {'aduros/ai.vim'},

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

    { 'folke/which-key.nvim' },  -- which-key in neovim

    -- Telescope
  'nvim-telescope/telescope.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {
    "benfowler/telescope-luasnip.nvim",
    },

      "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      'debugloop/telescope-undo.nvim',
        -- integration with obsidian
        -- use { 'epwalsh/obsidian.nvim'}
     { 'SCassidy-UK/obsidian.nvim'},
     { 'gaoDean/autolist.nvim'},


    -- language support and completion

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'mfussenegger/nvim-lint'},
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',
    'windwp/nvim-ts-autotag',

    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},

    {'VonHeikemen/lsp-zero.nvim',

    -- Language-specific
    {'AndrewRadev/tagalong.vim', ft='html'},

  }
}

