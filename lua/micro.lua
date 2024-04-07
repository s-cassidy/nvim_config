local job = require('plenary.job')
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local telescope_conf = require("telescope.config").values

local config = {
  blog_url = "https://samjc.me",
  blog_uid = "https://samjc.micro.blog"
}



local get_api_key = function()
  return os.getenv("MB_API_KEY")
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
  local categories_table = {}
  local feeds_table = vim.fn.json_decode(json_feed)
  for _, item in pairs(feeds_table.items) do
    table.insert(categories_table, item.title)
  end
  return categories_table
end


local refresh_categories = function()
  local categories_json = fetch_categories(config.blog_url)
  local await_categories_feed = vim.wait(5000, function() return #categories_json > 0 end)
  if await_categories_feed then
    config.categories = extract_categories_from_json_feed(categories_json)
  else
    print("No categories found at " .. config.blog_url .. "/categories/feed.json")
  end
end


local setup = function()
  config.api_key = get_api_key()
  refresh_categories()
end

local telescope_choose_categories = function(chosen_categories, cb)
  local cat_picker = pickers.new({}, {
    prompt_title =
    "Select categories (Use <tab> to select categories, <CR> to confirm selection. Quit this window to abort)",
    finder = finders.new_table(
      { results = config.categories }
    ),
    sorter = telescope_conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local multi_selection = current_picker:get_multi_selection()
        for _, selection in ipairs(multi_selection) do
          table.insert(chosen_categories, selection[1])
        end
        actions.close(prompt_bufnr)
        cb()
      end)
      map("i", "<CR>", actions.select_default)
      map("n", "<CR>", actions.select_default)
      map("i", "<tab>", actions.toggle_selection)
      map("n", "<tab>", actions.toggle_selection)
      map("n", "<esc>", actions.close)
      map("n", "q", actions.close)
      map("n", "<C-c>", actions.close)
      map("i", "<up>", actions.move_selection_previous)
      map("i", "<down>", actions.move_selection_next)
      map("i", "<C-p>", actions.move_selection_previous)
      map("i", "<next>", actions.move_selection_next)
      map("n", "<up>", actions.move_selection_previous)
      map("n", "<down>", actions.move_selection_next)
      return false
    end
  })
  cat_picker:find()
end


local collect_user_options = function()
  local title
  local destination
  local draft
  vim.ui.input(
    { prompt = "Post title (optional): " },
    function(input)
      title = input
    end)
  vim.ui.input({
      prompt = "Destination: ",
      default = config.blog_uid
    },
    function(input)
      destination = input
    end)
  vim.ui.select({ "Yes", "No" }, {
      prompt = "Post as a draft?"
    },
    function(choice)
      draft = (choice == "Yes")
    end
  )
  return { title = title, draft = draft, destination = destination }
end

--- Get contents of a buffer or lines appearing in a visual selection
---
--- @return string
local get_text = function()
  local content_lines
  if vim.fn.mode() == "n" then
    content_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    local line_start = vim.fn.getpos("v")[2]
    local line_end = vim.fn.getpos(".")[2]
    content_lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
  end
  local text = table.concat(content_lines, "\n")
  return text
end

--- Run curl to post to the blog
---
--- @param data {text: string, key: string, opts: {title: string?, destination: string, categories: string[]?}}
--- @return boolean
local send_post_request = function(data)
  local auth_string = "Authorization: Bearer " .. data.key
  local args = {
    "https://micro.blog/micropub",
    "-X", "POST",
    "-H", auth_string,
    "--data", "h=entry",
    "--data", "mp-destination=" .. data.opts.destination,
    "--data-urlencode", "content=" .. data.text,
    "--data-urlencode", "name=" .. (data.opts.title or ""),
    "--data", "post-status=" .. (data.opts.draft and "draft" or ""),
  }
  for _, cat in ipairs(data.opts.categories) do
    table.insert(args, "--data-urlencode")
    table.insert(args, "category[]=" .. cat)
  end

  local curl_job = job:new({
    command = "curl",
    args = args,
    enable_recording = true
  })

  curl_job:sync()
  local result_raw = curl_job:result()
  local await_post_confirmation = vim.wait(5000, function() return #result_raw > 0 end)
  if await_post_confirmation then
    local result = vim.fn.json_decode(result_raw)
    if result.error then
      print("Posting failed: " .. result.error_description)
      return false
    else
      vim.b.micro = result
      print("New post made to " .. result.url)
      return true
    end
  end
end


local new_post = function()
  local data = {}
  data.text = get_text()
  data.key = get_api_key()
  data.opts = collect_user_options()
  local chosen_categories = {}
  telescope_choose_categories(chosen_categories,
    function()
      data.opts.categories = chosen_categories
      send_post_request(data)
    end
  )
end

local get_posts = function()
  local curl_job = job:new(
    {
      command = "curl",
      args = {
        "https://micro.blog/micropub?q=source",
        "-H", "Authorization Bearer: " .. config.api_key,
      },
      enabled_recording = true,
    }
  )
end

setup()
vim.keymap.set({ "n", "v" }, "<leader>mp", new_post)
