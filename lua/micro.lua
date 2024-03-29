local job = require('plenary.job')
local path = require('plenary.path')

local config = {
  api_key_command = '~/.local/bin/mb-api-key'
}

local get_full_path = function(path_string)
  return path:new(path_string):expand()
end

local get_api_key = function()
  local command = get_full_path(config.api_key_command)
  local key_job = job:new({
    command = command,
    enable_recording = true,
  })
  key_job:sync()
  local key = key_job:result()[1]
  return key
end

local collect_user_options = function()
  local title = vim.ui.input({ prompt = "Post title (optional): " })
  local draft = vim.ui.select({ "Yes", "No" }, {
    prompt = "Post as a draft?"
  })
  return {
    title = title,
    draft = draft
  }
end

local get_text = function()
  local line_start
  local line_end
  if vim.api.nvim_get_mode().mode == "n" then
    line_start = 0
    line_end = -1
  elseif vim.api.nvim_get_mode().mode == "v" then
    local visual_start = vim.fn.getpos("'<")
    local visual_end = vim.fn.getpos("'>")
    line_start = visual_start[2]
    line_end = visual_end[2]
  end

  local content_lines = vim.api.nvim_buf_get_lines(0, line_start, line_end, false)
  local text = table.concat(content_lines, "\n")
  return text
end

local prepare_post_data = function()
  local opts = collect_user_options()
  local text = get_text()
end

local send_post = function(text, api_key, opts)
  local auth_string = "Authorization: Bearer " .. api_key
  local args = {
    "-X", "POST",
    "-H", auth_string,
    "-d", "h=entry",
    "--data-urlencode", "title=" .. opts.title,
    "--data-urlencode", "content=" .. text,
    "-d", "post-status=draft",
    "https://micro.blog/micropub"
  }
  local curl_job = job:new({
    command = "curl",
    args = args,
    enable_recording = true
  })
  curl_job:sync()
  return curl_job:result()
end

local key = get_api_key()
curl_result = send_post(get_text(), key, { title = "This is a title" })
