-- Universal plugins not specific to any file-type
--

local api = vim.api
local fn = vim.fn


-- The root dir to install all plugins. Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

--- Install packer if it has not been installed.
--- Return:
--- true: if this is a fresh install of packer
--- false: if packer has been installed
local function packer_ensure_install()
  -- Where to install packer.nvim -- the package manager (we make it opt)
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

  if fn.glob(packer_dir) ~= "" then
    return false
  end

  -- Auto-install packer in case it hasn't been installed.
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})

  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)
  vim.cmd(install_cmd)

  return true
end

local fresh_install = packer_ensure_install()

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require("packer.util")


return require('packer').startup({
  function(use)
    -- Needed to load first
    use { 'lewis6991/impatient.nvim' } -- Packer can manage itself use { 'wbthomason/packer.nvim'} 
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }

    -- Themes
    use { 'sainnhe/everforest' }
    use { 'Shatur/neovim-ayu' }

    -- statusline
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

    -- Tmux integration
    use { 'aserowy/tmux.nvim' }
    use {  'christoomey/vim-tmux-navigator' }

    -- quality of life
    use { 'karb94/neoscroll.nvim' }
    use 'echasnovski/mini.cursorword'
    use 'sudormrfbin/cheatsheet.nvim'

    use 'ThePrimeagen/harpoon'

    -- surround
    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    })

    -- comments
    use { 'numToStr/Comment.nvim' }

    -- tpope
    use { 'tpope/vim-repeat' } -- Integrates the repeat 
    use { 'tpope/vim-vinegar' } -- Improves netrw


    use { 'machakann/vim-highlightedyank' } -- Briefly highlights yanked region

    -- motion
    use { 'ggandor/leap.nvim' } -- Use s to leap anywhere on the screen, similar to sneak
    use { 'ggandor/flit.nvim' } -- Improves f and t

    use { 'folke/which-key.nvim' }  -- which-key in neovim

    -- Telescope
    use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
    "benfowler/telescope-luasnip.nvim",
    }
    -- integration with obsidian
    use { 'epwalsh/obsidian.nvim'}
    use { 'gaoDean/autolist.nvim'}

    -- language support and completion

    -- LSP Support
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'mfussenegger/nvim-lint'}

    use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
    }

    -- Autocompletion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lua'}

    use {'VonHeikemen/lsp-zero.nvim',
    requires = {
    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},

  }
}


  end
  })

