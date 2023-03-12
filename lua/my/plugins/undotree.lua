return {
  { 'mbbill/undotree', event = 'VeryLazy', config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>u"] = { vim.cmd.UndotreeToggle, "Undotree" }
    })
  end },
}
