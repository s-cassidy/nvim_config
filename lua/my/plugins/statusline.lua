return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      ---- Truncating components in smaller window
      local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
        return function(str)
          local win_width = vim.fn.winwidth(0)
          if hide_width and win_width < hide_width then
            return ""
          elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
          end
          return str
        end
      end

      require('lualine').setup({
        options = {
          globalstatus = true,
          section_separators = "",
          component_separators = "|"
        },
        winbar = {},
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        }
        --[[lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'branch'} --]]

      })
    end
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        segments = {
          { text = { builtin.foldfunc } },
          { text = { "%s" } },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
          { text = { " " } }
        }
      })
    end
  },

  {
    'nanozuki/tabby.nvim',
    config = function()
      local theme = {
        fill = 'TabLineFill',
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = 'TabLine',
        current_tab = 'TabLineSel',
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine',
      }
      require('tabby.tabline').set(function(line)
          return {
            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and theme.current_tab or theme.tab
              local numopen
              local numclose
              if tab.is_current() then
                numopen, numclose =
                    line.sep('[', theme.win, theme.fill),
                    line.sep(']', theme.win, theme.fill)
              else
                numopen = line.sep(' ', theme.win, theme.fill)
                numclose = numopen
              end
              return {
                numopen,
                tab.number(),
                numclose,
                tab.name(),
                hl = hl,
              }
            end),
            line.spacer(),
            {
            },
            hl = theme.fill,
          }
        end,
        {
          buf_name = {
            mode = "shorten",
          }
        }
      )
    end
  }

}
