local function directory_find(dir, callback, opts)
  callback = callback or print
  local selection = nil
  opts = opts or {}
  opts.finder = "proc"
  opts.cmd = "fdfind"
  opts.args = {
  '.',
  '--type',
  'd',
  '--strip-cwd-prefix',
}
  opts.transform = function(item)
    item.file = item.text
    item.dir = true
  end
  opts.confirm = function(picker, item)
				picker:close()
                callback(item.file)
			end
  Snacks.picker(opts)
end

vim.keymap.set("n","<leader>T", directory_find)
