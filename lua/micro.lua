local curl = require('plenary.curl')
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

local construct_data_string = function(text, opts)
  local data_string = "h=entry&"
end

local send_post = function(text, api_key, opts)
  -- local data = construct_data(text)
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
curl_result = send_post("Hello world", key, { title = "" })
