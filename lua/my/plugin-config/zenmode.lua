require("zen-mode").setup(
  {
    window = {
      backdrop = 1,
      width = 90,
      options = {
        signcolumn = "no", -- disable signcolumn
        -- number = false,     -- disable number column
        -- relativenumber = false, -- disable relative numbers
        -- cursorline = false, -- disable cursorline
        -- cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        list = false,     -- disable whitespace characters
      }
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,   -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
        -- you may turn on/off statusline in zen mode by setting 'laststatus'
        -- statusline will be shown only if 'laststatus' == 3
        laststatus = 0,               -- turn off the statusline in zen mode
      },
      gitsigns = { enabled = false }, -- disables git signs
      kitty = {
        enabled = false,
        font = "+4",              -- font size increment
      },
      tmux = { enabled = false }, -- disables the tmux statusline
    }
  }
)
