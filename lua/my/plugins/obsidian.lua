return {
  {
    's-cassidy/obsidian.nvim',
    dependencies =
    { 'gaoDean/autolist.nvim' },
    config = function()
      require "my.plugins.config.obsidian"
    end
  },
}
