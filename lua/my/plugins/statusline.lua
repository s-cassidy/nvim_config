return {
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }, config = function()

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
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
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
  { "luukvbaal/statuscol.nvim", config = function()
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
  }
}
