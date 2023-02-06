require("trailblazer").setup({
  -- your custom config goes here
  trail_options = {
    mark_symbol = "m", --  will only be used if trail_mark_symbol_line_indicators_enabled = true
    newest_mark_symbol = "", -- disable this mark symbol by setting its value to ""
    cursor_mark_symbol = "M", -- disable this mark symbol by setting its value to ""
    next_mark_symbol = "", -- disable this mark symbol by setting its value to ""
    previous_mark_symbol = "", -- disable this mark symbol by setting its value to ""
    trail_mark_symbol_line_indicators_enabled = true,
    multiple_mark_symbol_counters_enabled = false
  }
})
