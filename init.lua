vim.g.mapleader = " "
vim.g.maplocalleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup("my.plugins")
require("my.utils.sessions").on_startup()
require("my.colors")
require("my.keybindings")
require("my.autocmds")
require("my.settings")
require("my.lsp")
require("my.keybindings")
