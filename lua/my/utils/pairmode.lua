vim.api.nvim_create_user_command("PairMode", function()
    vim.cmd("set statuscolumn=%s%l\\ \\ %r")
  end,
  {})
