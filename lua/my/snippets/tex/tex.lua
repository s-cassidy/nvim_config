return {

  s(
    { trig = 'rcl', dscr = 'IEEEeqn array with an = sign alignment', type = "autosnippet" },
    fmta(
      [[\begin{IEEEeqnarray*}{rcl}
  <> &{}<>{}& <> \\
   <> &<>& <> \\
\end{IEEEeqnarray*}]],
      {
        i(1, ""),
        i(2, "="),
        i(3, ""),
        i(4, ""),
        rep(2, ""),
        i(5, ""),
      }
    )
  ),

  s(
    { trig = 'eq', dscr = 'Normal equation' },
    fmta(
      [[\begin{IEEEeqnarray*}{c}
  <>
\end{IEEEeqnarray*}]],
      {
        i(1, "")
      }
    )
  ),

  s(
    { trig = 'Def', dscr = 'For definitions' },
    fmta(
      "\\begin{Def}\n\t<>\n\\end{Def}",
      {
        i(1, "")
      }
    )
  ),
  s(
    { trig = 'Rem', dscr = 'For remarks' },
    fmta(
      "\\begin{Rem}\n\t<>\n\\end{Rem}",
      {
        i(1, "")
      }
    )
  ),
}
