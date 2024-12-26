---@type qmk.UserConfig
local conf = {
  name = 'LAYOUT_planck_grid',
  comment_preview = {
    keymap_overrides = {
      HERE_BE_A_LONG_KEY = 'Magic',       -- replace any long key codes
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
