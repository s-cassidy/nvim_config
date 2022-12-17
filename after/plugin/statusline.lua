require('lualine').setup({
  options = {
    globalstatus=true,
  },
  tabline = {
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'branch'}
}})
--{options = {theme='auto'}}
