require('lualine').setup({
  options = {
    globalstatus=true,
  },
  tabline = {
      lualine_a = {'buffers'},
      lualine_b = {'branch'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
}})
--{options = {theme='auto'}}
