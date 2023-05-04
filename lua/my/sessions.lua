local Path = require "plenary.path"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"




local M = {}

vim.g.session_dir = tostring(Path:new(vim.fn.stdpath "data") / "sessions")

if vim.fn.isdirectory(vim.g.session_dir) == 0 then
  vim.fn.mkdir(vim.g.session_dir, "p")
end

local function get_git_repo()
  return vim.fn.trim(vim.fs.basename(vim.fn.system "git rev-parse --show-toplevel"))
end

local function is_git_repo()
  if vim.fn.trim(vim.fn.system "git rev-parse --is-inside-work-tree") == "true" then
    return true
  else
    return false
  end
end


local function get_session_name()
  if is_git_repo then
    return get_git_repo()
  else
    if M.last_session then
      return M.last_session
    else
      local name_from_prompt
      vim.ui.input({ prompt = "Session name: ", default = "Session" },
        function(session_name)
          name_from_prompt = session_name
        end)
      return name_from_prompt
    end
  end
end


local function make_session(session_path)
  local cmd = "mks! " .. session_path
  vim.cmd(cmd)
end

local function make_full_path(session_name)
  return vim.g.session_dir .. '/' .. session_name .. ".vim"
end

function M.save_session()
  local session_path = make_full_path(get_session_name())
  make_session(session_path)
end

function M.load_session(session_name)
  local session_path = make_full_path(session_name)
  vim.cmd("source" .. session_path)
  M.last_session = session_name
end

-- Taken from echasnovski/mini.starter
local function vim_started_without_file()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then return false end
  local listed_buffers = vim.tbl_filter(
    function(buf_id) return vim.fn.buflisted(buf_id) == 1 end,
    vim.api.nvim_list_bufs()
  )
  if #listed_buffers > 1 then return false end
  if vim.fn.argc() > 0 then return false end
  return true
end



-- stupidly, treesitter doesn't like starting if a file is opened during VimEnter event.
-- However, running :edit seems to bring TS back to life, so we run it after a short delay
-- at the end of M.on_startup()
local function enable_TS()
  local windows = vim.api.nvim_list_wins()
  for k, win in ipairs(windows) do
    vim.api.nvim_call_function("win_execute", { win, 'lua pcall(vim.cmd, "edit")' })
  end
end

function M.on_startup()
  if vim_started_without_file() then
    if is_git_repo() then
      local repo_name = get_git_repo()
      local path = make_full_path(repo_name)
      if vim.fn.filereadable(path) == 1 then
        M.load_session(repo_name)
        vim.defer_fn(enable_TS, 50)
      end
    end
  end
end

function M.try_autosave()
  if M.last_session then
    local path = make_full_path(M.last_session)
    if vim.fn.filereadable(path) == 1 then
      M.save_session()
    end
  end
end

local function restore_from_telescope(prompt_bufnr, _)
  actions.select_default:replace(
    function()
      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      local session_name = selection[1]:gsub("%.vim", "")
      M.load_session(session_name)
    end
  )
  return true
end

function M.list_sessions()
  local opts = {
    attach_mappings = restore_from_telescope,
    prompt_title = "Select session ",
    cwd = vim.g.session_dir
  }
  require("telescope.builtin").find_files(opts)
end

local function delete_session(prompt_bufnr, _)
  actions.select_default:replace(function()
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    local session_name = selection[1]:gsub("./", "")
    session_name = vim.g.session_dir .. "/" .. session_name
    vim.fn.delete(session_name)
  end)
  return true
end

function M.delete_session()
  local opts = {
    attach_mappings = delete_session,
    prompt_title = "Delete session ",
    cwd = vim.g.session_dir,
  }
  require("telescope.builtin").find_files(opts)
end

function M.toggle_tracking()
  if M.last_session then
    M.last_session = false
    print("No longer tracking changes to session")
  else
    M.save_session()
    print("Tracking changes to session")
  end
end

-- save session if working from a session
vim.api.nvim_create_autocmd({ "WinNew", "WinClosed", "TabNew", "TabClosed", }, {
  callback = function()
    M.try_autosave()
  end
}
)


-- save session on exit
vim.api.nvim_create_autocmd({ "ExitPre", }, {
  callback = function()
    M.try_autosave()
    vim.cmd('sleep 10m') -- workaround for stopping a glitch where an error appears if vim calls a shell command on ExitPre
  end
}
)

-- launch session if vim opened with no arguments in a git repo
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    M.on_startup()
  end
}
)

local wk = require("which-key")
wk.register({
  ["<leader>s"] = { name = "+sessions" },
  ["<leader>ss"] = { M.save_session, "Save session" },
  ["<leader>so"] = { M.list_sessions, "Open session" },
  ["<leader>st"] = { M.toggle_tracking, "Toggle session recording" },
  ["<leader>sd"] = { M.delete_session, "Delete a session file" },
}
)

return M
