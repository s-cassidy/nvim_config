return {

  s(
    { trig = 'def',  dscr = 'Define a function'},
    fmt(
      "def {}({}): -> {}\n    ",
      {
        i(1, "name"),
        i(2, "parameters"),
        i(3, "type"),
      }
    )
  ),

}
