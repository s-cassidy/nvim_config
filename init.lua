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
require("my.autocmds")
require("my.settings")
require("lazy").setup("my.plugins")
require("my.keybindings")
require("my.colors")
require("my.lsp.init")
require("my.sessions")
require("my.todotxt")
require("my.utils.pairmode")
