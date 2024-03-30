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
  local title
  local draft
  vim.ui.input({ prompt = "Post title (optional): " }, function(input) title = input end)
  vim.ui.select({ "Yes", "No" }, {
    prompt = "Post as a draft?"
  }, function(choice) draft = (choice == "Yes") end
  )
  return {
    title = title,
    draft = draft
  }
end


local get_text = function()
  local line_start
  local line_end
  if vim.fn.mode() == "n" then
    line_start = 0
    line_end = -1
  elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    local visual_start = vim.fn.getpos("v")
    local visual_end = vim.fn.getpos(".")
    line_start = visual_start[2]
    line_end = visual_end[2]
  end

  local content_lines = vim.api.nvim_buf_get_lines(0, line_start, line_end + 1, false)
  local text = table.concat(content_lines, "\n")
  return text
end


local send_request = function(text, api_key, opts)
  local auth_string = "Authorization: Bearer " .. api_key
  local args = {
    "-X", "POST",
    "-H", auth_string,
    "-H", "Content-Type: application/json",
    "--data", vim.fn.json_encode({
    type = "h-entry",
    properties = {
      content = { text },
      name = { opts.title },
      ["post-status"] = { "draft" },
    }
  }
  ),
    "https://micro.blog/micropub"
  }

  local curl_job = job:new({
    command = "curl",
    args = args,
    enable_recording = true
  })

  curl_job:sync()
  local result_raw = curl_job:result()
  local result = vim.fn.json_decode(result_raw)
  vim.b.micro = result
end


local new_post = function()
  local text = get_text()
  local key = get_api_key()
  local opts = collect_user_options()
  return send_request(text, key, opts)
end

vim.keymap.set({ "n", "v" }, "<leader>mp", new_post)
