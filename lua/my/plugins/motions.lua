return {
  { 'ggandor/leap.nvim', event = "VeryLazy", -- Use s to leap anywhere on the screen, similar to sneak
    config = function()
      require('leap').set_default_keymaps()
    end
  },
}
