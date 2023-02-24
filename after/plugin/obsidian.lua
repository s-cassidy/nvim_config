require("obsidian").setup({
  dir = "~/notes/wiki/",
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H.%M"
  },
  disable_frontmatter = true,
  note_frontmatter_func = nil,
  daily_notes = { folder = "journal" },
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
