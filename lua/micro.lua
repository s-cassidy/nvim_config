local job = require('plenary.job')
local path = require('plenary.path')
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_utils = require "telescope.actions.utils"
local telescope_conf = require("telescope.config").values

local config = {
  api_key_command = '~/.local/bin/mb-api-key',
  blog_url = 'https://samjc.me'
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

local fetch_categories = function(blog_url)
  local category_job = job:new({
    command = "curl",
    args = { blog_url .. "/categories/feed.json" },
    enable_recording = true,
  })
  category_job:start()
  return category_job:result()
end

local extract_categories_from_json_feed = function(json_feed)
  local categories = {}
  local feeds_table = vim.fn.json_decode(json_feed)
  for k, item in pairs(feeds_table.items) do
    table.insert(categories, item.title)
  end
  return categories
end

local telescope_choose_categories = function(all_categories, chosen_categories, cb)
  local cat_picker = pickers.new({}, {
    prompt_title = "Select categories (optional)",
    finder = finders.new_table(
      { results = all_categories }
    ),
    sorter = telescope_conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        for _, selection in ipairs(current_picker:get_multi_selection()) do
          table.insert(chosen_categories, selection[1])
        end
        print(vim.inspect(chosen_categories))
        actions.close(prompt_bufnr)
        cb()
      end)
      return true
    end
  })
  cat_picker:find()
end


local collect_user_options = function()
  local title
  local draft
  vim.ui.input({ prompt = "Post title (optional): " }, function(input)
    title = input
  end)
  vim.ui.select({ "Yes", "No" }, {
      prompt = "Post as a draft?"
    },
    function(choice)
      draft = (choice == "Yes")
    end
  )
  return { title, draft }
end


local get_text = function()
  local line_start
  local line_end
  local content_lines
  if vim.fn.mode() == "n" then
    content_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    local visual_start = vim.fn.getpos("v")
    local visual_end = vim.fn.getpos(".")
    line_start = visual_start[2]
    line_end = visual_end[2]
    content_lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
  end
  local text = table.concat(content_lines, "\n")
  return text
end


local send_request = function(data)
  local auth_string = "Authorization: Bearer " .. data.key
  print(vim.inspect(data.opts.categories))
  local args = {
    "-X", "POST",
    "-H", auth_string,
    "-H", "Content-Type: application/json",
    "--data", vim.fn.json_encode({
    type = "h-entry",
    properties = {
      content = { data.text },
      name = { data.opts.title },
      ["post-status"] = { "draft" },
      category = { data.opts.categories }
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
  local categories_feed = fetch_categories(config.blog_url)
  local data = {}
  data.text = text
  data.key = get_api_key()
  data.opts = collect_user_options()
  local all_categories = extract_categories_from_json_feed(categories_feed)
  local chosen_categories = {}
  telescope_choose_categories(all_categories, chosen_categories, function()
    data.opts.categories = chosen_categories
    send_request(data)
  end
  )
end

vim.keymap.set({ "n", "v" }, "<leader>mp", new_post)
