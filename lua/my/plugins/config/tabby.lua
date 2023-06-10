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
