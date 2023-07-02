local M = {}

M.toggle_checkbox = function()
  local line = vim.api.nvim_get_current_line()
  line = line:gsub("^%s*(.-)%s*$", "%1")
  if string.sub(line, 1, 2) ~= "- " and string.sub(line, 1, 2) ~= "* " then
    print("got here")
    return
  end

  local pos = vim.api.nvim_win_get_cursor(0)
  if string.sub(line, 3, 5) == "[ ]" then
    vim.cmd("s/\\[ \\]/[x]")
    vim.api.nvim_win_set_cursor(0, pos)
    return
  elseif string.sub(line, 3, 5) == "[x]" then
    vim.cmd("s/\\[x\\]/[ ]")
    vim.api.nvim_win_set_cursor(0, pos)
    return
  end
  if string.sub(line, 1, 1) == "-" then
    vim.cmd("s/- /- [ ] ")
    vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + 4 })
  elseif
      string.sub(line, 1, 1) == "*" then
    vim.cmd("s/* /* [ ] ")
    vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + 4 })
  end
end

return M
