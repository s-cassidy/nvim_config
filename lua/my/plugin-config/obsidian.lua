require("obsidian").setup({
  dir = "~/notes/",
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

local daily_template = function()
  clear_and_add_template("Daily Pages Template.md")
end

local note_template = function()
  clear_and_add_template("Note Template.md")
end

local source_template = function()
  clear_and_add_template("Source Template.md")
end


require("which-key").register({
  ["<leader>v"] = { name = "+obsidian" },
  ["<leader>vv"] = { ":tabe ~/wiki<cr>:tcd ~/wiki<cr>:TabRename vault<cr>",
    "Go to vault" },
  ["<leader>vt"] = { ":ObsidianTemplate<cr>", "Insert template" },
  ["<leader>vd"] = { ":ObsidianToday<cr>", "Daily note" },
  ["<leader>vn"] = { ":ObsidianNew ", "New note" },
  ["<leader>vs"] = { source_template, "Source template" },
  ["<leader>vz"] = { note_template, "Note template" },
  ["<leader>vj"] = { daily_template, "Daily template" },
  ["<leader>vg"] = { ":ObsidianSearch<cr>", "Search in vault" },
  ["<leader>vm"] = { ":GMove ~/wiki/", "Move/rename note" }, -- reqiures fugitive.vim
})
