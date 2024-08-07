local vault_path = "~/notes/"

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
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
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

local clear_and_add_template = function(template)
  vim.cmd("e! %")
  vim.cmd("execute 'normal dd'")
  vim.cmd("ObsidianTemplate " .. template)
  vim.cmd("call feedkeys(':','nx')") -- clear message window
end

local new_note = function(folder)
  local title
  vim.ui.input({ prompt = "Note title: " },
    function(input)
      title = input
    end)
  local filename = tostring(os.date("%Y%m%d%H%M")) .. " " .. title
  local buffer = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buffer)
  vim.bo.filetype = "markdown"
  vim.cmd("w " .. vault_path .. filename .. ".md")
  vim.cmd("ObsidianTemplate note")
  vim.cmd("w")
  vim.cmd("Git add .")
  vim.cmd("Git commit -q -m 'Create note " .. tostring(os.date("%Y%m%d%H%M")) .. "'")
end

local daily_note = function()
  local filename = tostring(os.date("%Y-%m-%d-%a"))
  local f = io.open(vault_path .. "journal/" .. filename .. ".md")
  if f ~= nil then
    io.close(f)
    vim.cmd("e" .. vault_path .. "journal/" .. filename .. ".md")
  else
    local buffer = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buffer)
    vim.bo.filetype = "markdown"
    vim.cmd("w " .. vault_path .. "journal/" .. filename .. ".md")
    vim.cmd("ObsidianTemplate daily")
    local title_line = "# " .. tostring(os.date("%Y-%m-%d | %A"))
    vim.api.nvim_buf_set_lines(buffer, 5, 6, true, { title_line })
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
  local actions = require("telescope.actions")
  local finders = require("telescope.finders")
  local telescope_conf = require("telescope.config").values
  local action_state = require "telescope.actions.state"
  require("telescope.pickers").new(opts, {
    prompt_title = "Find Directory",
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


require("which-key").register({
  ["<leader>v"] = { name = "+obsidian" },
  ["<leader>vv"] = { ":tabe ~/notes<cr>:tcd ~/notes<cr>:TabRename vault<cr>",
    "Go to vault" },
  ["<leader>vt"] = { ":ObsidianTemplate<cr>", "Insert template" },
  ["<leader>vb"] = { ":ObsidianBacklinks<cr>", "Backlinks" },
  ["<leader>vff"] = { find_in_folder, "Folder files" },
  ["<leader>vfs"] = { search_in_folder, "Folder search" },
  ["<leader>vd"] = { daily_note, "Daily note" },
  ["<leader>vn"] = { new_note, "New note" },
  ["<leader>vs"] = { source_template, "Source template" },
  ["<leader>vz"] = { note_template, "Note template" },
  ["<leader>vj"] = { daily_template, "Daily template" },
  ["<leader>vg"] = { ":ObsidianSearch<cr>", "Search in vault" },
  ["<leader>vm"] = { move_to_folder, "Move note" }, -- reqiures fugitive.vim
})
