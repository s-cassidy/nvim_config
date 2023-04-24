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
  vim.cmd("stopinsert")
  M.last_session = session_name
end

function M.on_startup()
  if is_git_repo() then
    local repo_name = get_git_repo()
    local path = make_full_path(repo_name)
    if vim.fn.filereadable(path) == "1" then
      M.load_session(repo_name)
    end
  end
end

function M.try_autosave()
  if M.last_session then
    local path = make_full_path(M.last_session)
    if vim.fn.filereadable(path) == "1" then
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

return M
