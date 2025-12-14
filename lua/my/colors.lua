local light_colour = "kanso-pearl"
local dark_colour = "kanso-zen"
local colour_mode = "dark"
vim.cmd [[colorscheme rosebones]]

local function toggle_light_dark()
 if colour_mode == "dark" then
    colour_mode = "light"
    vim.cmd("colorscheme " .. light_colour)
  else
    colour_mode = "dark"
    vim.cmd( "colorscheme " .. dark_colour)
  end
end

vim.keymap.set("n", "<F2>", toggle_light_dark, {desc = "Toggle light/dark mode"})
-- vim.cmd.colorscheme ""
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#E82424" }) -- set comment color to red. comments should stand out not hide away!
