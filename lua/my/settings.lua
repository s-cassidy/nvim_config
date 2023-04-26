local options = {
  -- clipboard      = "unnamed,unnamedplus",   --- Copy-paste between vim and everything else
  cmdheight      = 1,    --- Give more space for displaying messages
  cursorline     = true, --- Highlight of current line
  expandtab      = true, --- Use spaces instead of tabs
  ignorecase     = true, --- Needed for smartcase
  laststatus     = 3,    --- Have a global statusline at the bottom instead of one for each window (interesting)
  lazyredraw     = true, --- Makes macros faster & prevent errors in complicated mappings
  mouse          = "a",  --- Enable mouse
  number         = true, --- Shows current line number
  completeopt    = 'menu,menuone,noselect',
  autoread       = true, --- update remotely changed files automatically
  pumheight      = 10,   --- Max num of items in completion menu
  relativenumber = true, --- Enables relative number
  scrolloff      = 8,    --- Always keep space when scrolling to bottom/top edge
  shiftwidth     = 2,    --- Change a number of space characeters inseted for indentation
  sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
  showtabline    = 1,
  foldcolumn     = "1",                  -- show folds in sign column
  smartcase      = true,                 --- Uses case in search
  smartindent    = true,                 --- Makes indenting smart
  smarttab       = true,                 --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2,                    --- Insert 2 spaces for a tab
  splitright     = true,                 --- Vertical splits will automatically be to the right
  splitbelow     = true,                 --- Horizontal splits go below
  tabstop        = 4,                    --- Insert 2 spaces for a tab
  termguicolors  = true,                 --- Correct terminal colors
  timeoutlen     = 200,                  --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
  undofile       = true,                 --- Sets undo to file
  updatetime     = 100,                  --- Faster completion
  viminfo        = "'1000",              --- Increase the size of file history
  inccommand     = "nosplit",            --- realtime previous search/replace
  wrap           = true,                 --- Display long lines as just one line
  linebreak      = true,                 --- Visually break line at edge of window, not "logically" break line
  writebackup    = false,                --- Not needed
  title          = true,                 --- set window title to current buffer
  guifont        = "LigaSFMonoNerdFont", --- patched font
  swapfile       = false,                -- don't use swap files
  -- Neovim defaults
  autoindent     = true,                 --- Good auto indent
  backspace      = "indent,eol,start",   --- Making sure backspace works
  backup         = false,                --- Recommended by coc
  conceallevel   = 2,                    --- Show `` in markdown files
  encoding       = "utf-8",              --- The encoding displayed
  errorbells     = false,                --- Disables sound effect for errors
  fileencoding   = "utf-8",              --- The encoding written to file
  hlsearch       = false,                --- Don't leave searches highlighted
  incsearch      = true,                 --- Start searching before pressing enter
  showmode       = false,                --- Don't show things like -- INSERT -- anymore
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--[[for k, v in pairs(globals) do
  vim.g[k] = v
end--]]
-- Don't show the cursor line when the window isn't focused
vim.cmd([[
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END]])

vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
augroup END]])
