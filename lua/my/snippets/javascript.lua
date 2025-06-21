return {

  s(
    { trig = 'afn',  dscr = 'Arrow function'},
    fmta(
      "(<>) =>> {<>}",
      {
        i(1, "params"),
        i(2, "body"),
      }
    )
  ),

  s(
    { trig = 'fn',  dscr = 'Create function'},
    fmta(
      "function <>(<>) {\n<>\n}",
      {
        i(1, "name"),
        i(2, "params"),
        i(3, "body"),
      }
    )
  ),

s(
  { trig = 'elem',  dscr = 'Create element'},
  fmt(
    "document.createElement({})",
    {
      i(1, "element")
    }
  )
),

}
