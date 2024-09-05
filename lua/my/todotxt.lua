local function get_date_string()
  return os.date("%Y-%m-%d")
end


local function date_on_newline(direction)
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  if direction == "o" then
    vim.api.nvim_buf_set_lines(0, row, row, false, { get_date_string() .. " " })
    vim.cmd.normal("j")
  else
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { get_date_string() .. " " })
    vim.cmd.normal("k")
  end
  vim.cmd("startinsert!")
end

local function grep_in_todo()
  require("telescope.builtin").live_grep({
    prompt_title = "Search tasks",
    cwd = require("telescope.utils").buffer_dir()
  })
end


local function toggle_completion()
  local line = vim.api.nvim_get_current_line()
  local pos = vim.api.nvim_win_get_cursor(0)
  if string.sub(line, 1, 2) == "x " then
    vim.api.nvim_buf_set_text(0, pos[1] - 1, 0, pos[1] - 1, 13, {})
    vim.api.nvim_win_set_cursor(0, { pos[1], math.max(pos[2] - 13, 0) })
    return
  else
    vim.api.nvim_buf_set_text(0, pos[1] - 1, 0, pos[1] - 1, 0, { "x " .. get_date_string() .. " " })
    vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + 13 })
    return
  end
end


local function on_write(opts)
  if string.find(opts.file, "archive.txt") then return end
  vim.cmd("sort")
  local lines = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  local complete = {}
  local pending = {}
  for _, line in ipairs(lines) do
    if string.sub(line, 1, 2) == "x " then
      table.insert(complete, line)
    else
      table.insert(pending, line)
    end
  end
  for _, line in ipairs(complete) do
    vim.cmd("!echo " .. line .. " >> /home/sam/notes/todo/archive.txt")
  end
  vim.api.nvim_buf_set_lines(opts.buf, 0, -1, false, pending)
end


-- autocmds to detect when to apply the above config

vim.api.nvim_create_augroup('todotxt', { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "/home/sam/notes/todo/*",
  group = "todotxt",
  callback = on_write
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "/home/sam/notes/todo/*",
  group = "todotxt",
  callback = function()
    vim.keymap.set("n", "<leader>tx", toggle_completion, { buffer = true, silent = true })
    vim.keymap.set("n", "<leader>ts", grep_in_todo, { buffer = true, silent = true })
    vim.keymap.set("n", "o", function() date_on_newline("o") end, { noremap = true, buffer = true, silent = true })
    vim.keymap.set("n", "O", function() date_on_newline("O") end, { noremap = true, buffer = true, silent = true })
  end
})
