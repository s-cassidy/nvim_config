local actions = require("telescope.actions")
local finders = require("telescope.finders")
local telescope_conf = require("telescope.config").values
local action_state = require "telescope.actions.state"
local vault_path = vim.fn.expand("~/notes/")

require("obsidian").setup({
  workspaces = {
    {
      name = "notes",
      path = vault_path
    }
  },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H.%M"
  },
  disable_frontmatter = true,
  note_frontmatter_func = nil,
  daily_notes = { folder = "journal", date_format = "%Y-%m-%d-%a" },
  completion = {
    nvim_cmp = false, -- if using nvim-cmp, otherwise set to false
    blink = true,
    min_chars = 2,
  },
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    title = title or ""
    return tostring(os.date("%Y%m%d%H%M")) .. " " .. title
  end
})
vim.keymap.set(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true }
)


--[[
--Slightly annoying, this is to insert a new note with a template.
--This annoying hack is used because Obsidian.nvim asynchronously modifies
--and saves the file on disk (without opening the file as a buffer)
--with an added title. If the template is inserted before this completes,
--an _even more annoying_ error message comes up saying the buffer has been modified
--on disk since reading it
]]
--


local function get_text()
  local content_lines
  local visual_start
  local visual_end
  if vim.fn.mode() == "n" then
    content_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    visual_start = vim.fn.getpos("v")
    visual_end = vim.fn.getpos(".")
    -- "." is the cursor position, "v" is the other end of the visual selection.
    -- They must be swapped if the cursor is at the start of the visual selection
    if visual_start[2] > visual_end[2] or (
          visual_start[2] == visual_end[2] and visual_start[3] > visual_end[3]
        ) then
      visual_start, visual_end = visual_end, visual_start
    end
    if vim.fn.mode() == "v" then
      content_lines = vim.api.nvim_buf_get_text(
        0,
        visual_start[2] - 1,
        visual_start[3] - 1,
        visual_end[2] - 1,
        visual_end[3],
        {}
      )
    else
      content_lines = vim.api.nvim_buf_get_lines(0, visual_start[2] - 1, visual_end[2], false)
    end
  end
  return content_lines, visual_start[2] - 1, visual_end[2]
end


local clear_and_add_template = function(template)
  vim.cmd("e! %")
  vim.cmd("execute 'normal dd'")
  vim.cmd("ObsidianTemplate " .. template)
  vim.cmd("call feedkeys(':','nx')") -- clear message window
end

local create_note = function(filename, folder, text)
  local buffer = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buffer)
  vim.bo.filetype = "markdown"
  vim.cmd("w " .. vault_path .. folder .. "/" .. filename .. ".md")
  vim.cmd("ObsidianTemplate note")
  if text then
    vim.api.nvim_buf_set_lines(buffer, 7, 7, false, text)
  end
  vim.cmd("w")
  vim.cmd("Git add .")
  vim.cmd("Git commit -q -m 'Create note " .. tostring(os.date("%Y%m%d%H%M")) .. "'")
end

local new_note = function(title, text)
  local filename
  if not title then
    vim.ui.input({ prompt = "Note title: " },
      function(input)
        title = input
      end)
  end
  filename = tostring(os.date("%Y%m%d%H%M")) .. " " .. title
  require("telescope.pickers").new(opts, {
    prompt_title = "Move to...",
    finder = finders.new_oneshot_job({ "fdfind", "-td" }, {}),
    sorter = telescope_conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        if selection ~= nil then
          actions.close(prompt_bufnr)
          create_note(filename, selection[1], text)
        end
      end)
      return true
    end,
  }):find()
end

local extract_note = function()
  local text
  local start_line
  local end_line
  local buffer = vim.api.nvim_get_current_buf()
  text, start_line, end_line = get_text()
  local title
  vim.ui.input({ prompt = "Note title: " },
    function(input)
      title = input
    end)
  local filename = tostring(os.date("%Y%m%d%H%M")) .. " " .. title
  new_note(title, text)
  vim.api.nvim_buf_set_lines(buffer, start_line, end_line, true, { ("Extracted note to [[%s]]"):format(filename) })
end

local daily_note = function()
  local filename = tostring(os.date("%Y-%m-%d-%a"))
  local f = io.open(vault_path .. "journal/" .. filename .. ".md", "r")
  if f then
    io.close(f)
    vim.cmd("e" .. vault_path .. "journal/" .. filename .. ".md")
  else
    local buffer = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buffer)
    vim.bo.filetype = "markdown"
    vim.cmd("w " .. vault_path .. "journal/" .. filename .. ".md")
    vim.cmd("ObsidianTemplate daily-nvim")
    local title_line = "# " .. tostring(os.date("%Y-%m-%d | %A"))
    vim.api.nvim_buf_set_lines(buffer, 5, 5, true, { title_line })
    vim.cmd("w")
    vim.cmd("Git add .")
    vim.cmd("Git commit -q -m 'Create note " .. tostring(os.date("%Y-%m-%d-%a")) .. "'")
  end
  vim.api.nvim_win_set_cursor(0, { 8, 0 })
end

local daily_template = function()
  clear_and_add_template("daily.md")
end

local note_template = function()
  clear_and_add_template("note.md")
end

local source_template = function()
  clear_and_add_template("source.md")
end

local search_in_folder = function()
  require("telescope").extensions.dir.live_grep()
end

local find_in_folder = function()
  require("telescope").extensions.dir.find_files()
end

local move_to_folder = function()
  require("telescope.pickers").new(opts, {
    prompt_title = "Move to...",
    finder = finders.new_oneshot_job({ "fdfind", "-td" }, {}),
    sorter = telescope_conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        if selection ~= nil then
          actions.close(prompt_bufnr)
          vim.cmd("GMove " .. selection[1])
        end
      end)
      return true
    end,
  }):find()
end

require('render-markdown').enable()

vim.keymap.set("v", "<leader>vx", extract_note, { desc = "Extract note" })

require("which-key").add({
  { "<leader>v",   name = "+obsidian" },
  { "<leader>vv",  ":tabe ~/notes<cr>:tcd ~/notes<cr>:TabRename vault<cr>", desc = "Go to vault" },
  { "<leader>vt",  ":ObsidianTemplate<cr>",                                 desc = "Insert template" },
  { "<leader>vb",  ":ObsidianBacklinks<cr>",                                desc = "Backlinks" },
  { "<leader>vff", find_in_folder,                                          desc = "Folder files" },
  { "<leader>vfs", search_in_folder,                                        desc = "Folder search" },
  { "<leader>vd",  daily_note,                                              desc = "Daily note" },
  { "<leader>vn",  new_note,                                                desc = "New note" },
  { "<leader>vs",  source_template,                                         desc = "Source template" },
  { "<leader>vz",  note_template,                                           desc = "Note template" },
  { "<leader>vj",  daily_template,                                          desc = "Daily template" },
  { "<leader>vg",  ":ObsidianSearch<cr>",                                   desc = "Search in vault" },
  { "<leader>vm",  move_to_folder,                                          desc = "Move note" }, -- reqiures fugitive.vim
})
