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
    lualine_x = {
      -- {
      --   require("noice").api.statusline.mode.get,
      --   cond = require("noice").api.statusline.mode.has,
      --   color = { fg = "#ff9e64" }
      -- },
      'filetype'
    },
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
