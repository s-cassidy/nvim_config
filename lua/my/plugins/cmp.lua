return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = function()
      require "my.plugins.config.cmp"
    end
  },

  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'dcampos/nvim-snippy', event = 'InsertEnter' },
  { 'honza/vim-snippets',  event = 'InsertEnter' },
  { 'dcampos/cmp-snippy',  event = 'InsertEnter' },

}
