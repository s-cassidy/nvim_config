return {
  { 'echasnovski/mini.cursorword', config = function() require('mini.cursorword').setup() end, event = "CursorMoved" }, -- underline occurrences of word under cursor
  { 'echasnovski/mini.ai', event = "VeryLazy", config = function() require('mini.ai').setup() end }, -- Improves a and i text objects
  { 'echasnovski/mini.bracketed', event = "VeryLazy", config = function() require('mini.bracketed').setup() end }, -- lots of [ ] pair commands
  { 'echasnovski/mini.splitjoin', event = "VeryLazy", config = function() require('mini.splitjoin').setup() end }, -- join and split things
  { 'echasnovski/mini.colors', event = "VeryLazy", config = function() require('mini.colors').setup() end }, -- join and split things
}
