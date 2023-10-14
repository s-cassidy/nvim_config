vim.cmd[[colorscheme tokyonight-night]]
-- trasparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "FoldColumn", { link = "Normal", bg = "NONE" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#E82424" }) -- set comment color to red. comments should stand out not hide away!
