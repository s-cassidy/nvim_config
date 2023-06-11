require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,    -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = { dark0 = "#1D2122", dark0_hard = "#1D2122" },
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

-- trasparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "FoldColumn", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#E82424" }) -- set comment color to red. comments should stand out not hide away!
