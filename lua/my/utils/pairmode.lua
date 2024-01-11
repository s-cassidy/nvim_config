local start_pair_mode = function()
  vim.cmd("set statuscolumn=%s%l\\ \\ %r")
end

vim.api.nvim_create_user_command("PairMode", start_pair_mode, {})
