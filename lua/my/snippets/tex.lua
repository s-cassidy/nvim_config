local in_math = function()
  return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local snippets = {
  s(
    { trig = 'beg',  dscr = 'New environment'},
    fmta(
      [[\begin{<>}
  <>
\end{<>}]],
      {
        i(1, "env"),
        i(2, ""),
        rep(1, "env")
      }
    )
  ),

  s(
    { trig = 'rcl', dscr = 'IEEEeqn array with an = sign alignment' },
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
    { trig = 'frac', dscr = 'fractions' },
    fmta(
      [[\frac{<>}{<>}]],
      {
        i(1, ""),
        i(2, ""),
      }
    ),
    { condition = in_math }
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

  s(
    { trig = 'itm',  dscr = 'Itemize environment'},
    fmta(
      "\\begin{itemize}\n\t\\item <>\n\\end{itemize}",
      {
        i(1, "")
      }
    )
  ),
}

local imap_leader = ";"

local imaps = {
  ['0'] = '\\emptyset',
  ['2'] = '\\sqrt',
  ['6'] = '\\partial',
  ['8'] = '\\infty',
  ['='] = '\\equiv',
  ['\\'] = '\\setminus',
  ['.'] = '\\cdot',
  ['*'] = '\\times',
  ['<'] = '\\langle',
  ['>'] = '\\rangle',
  ['H'] = '\\hbar',
  ['+'] = '\\dagger',
  ['['] = '\\subseteq',
  [']'] = '\\supseteq',
  ['('] = '\\subset',
  [')'] = '\\supset',
  ['A'] = '\\forall',
  ['B'] = '\\boldsymbol',
  ['E'] = '\\exists',
  ['N'] = '\\nabla',
  ['jj'] = '\\downarrow',
  ['jJ'] = '\\Downarrow',
  ['jk'] = '\\uparrow',
  ['jK'] = '\\Uparrow',
  ['jh'] = '\\leftarrow',
  ['jH'] = '\\Leftarrow',
  ['jl'] = '\\rightarrow',
  ['jL'] = '\\Rightarrow',
  ['a'] = '\\alpha',
  ['b'] = '\\beta',
  ['c'] = '\\chi',
  ['d'] = '\\delta',
  ['e'] = '\\epsilon',
  ['f'] = '\\phi',
  ['g'] = '\\gamma',
  ['h'] = '\\eta',
  ['i'] = '\\iota',
  ['k'] = '\\kappa',
  ['l'] = '\\lambda',
  ['m'] = '\\mu',
  ['n'] = '\\nu',
  ['p'] = '\\pi',
  ['q'] = '\\theta',
  ['r'] = '\\rho',
  ['s'] = '\\sigma',
  ['t'] = '\\tau',
  ['y'] = '\\psi',
  ['u'] = '\\upsilon',
  ['w'] = '\\omega',
  ['z'] = '\\zeta',
  ['x'] = '\\xi',
  ['D'] = '\\Delta',
  ['F'] = '\\Phi',
  ['G'] = '\\Gamma',
  ['L'] = '\\Lambda',
  ['P'] = '\\Pi',
  ['Q'] = '\\Theta',
  ['S'] = '\\Sigma',
  ['U'] = '\\Upsilon',
  ['W'] = '\\Omega',
  ['X'] = '\\Xi',
  ['Y'] = '\\Psi',
  ['ve'] = '\\varepsilon',
  ['vf'] = '\\varphi',
  ['vk'] = '\\varkappa',
  ['vp'] = '\\varpi',
  ['vq'] = '\\vartheta',
  ['vr'] = '\\varrho',
  -- \ { 'lhs' : '/',  'rhs' : 'vimtex#imaps#style_math("slashed")', 'expr' : 1, 'leader' : '#'},
  -- \ { 'lhs' : 'b',  'rhs' : 'vimtex#imaps#style_math("mathbf")', 'expr' : 1, 'leader' : '#'},
  -- \ { 'lhs' : 'f',  'rhs' : 'vimtex#imaps#style_math("mathfrak")', 'expr' : 1, 'leader' : '#'},
  -- \ { 'lhs' : 'c',  'rhs' : 'vimtex#imaps#style_math("mathcal")', 'expr' : 1, 'leader' : '#'},
  -- \ { 'lhs' : '-',  'rhs' : 'vimtex#imaps#style_math("overline")', 'expr' : 1, 'leader' : '#'},
  -- \ { 'lhs' : 'B',  'rhs' : 'vimtex#imaps#style_math("mathbb")', 'expr' : 1, 'leader' : '#'},
}


for trig, snip in pairs(imaps) do
  table.insert(snippets,
    s(
      { trig = imap_leader .. trig, dscr = snip, snippetType = 'autosnippet', },
      { t(snip) },
      {
        condition = in_math
      }
    )
  )
end

return snippets
