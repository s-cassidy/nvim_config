return {
s(
  { trig = 'blogfm',  dscr = 'Frontmatter for blogpost'},
  fmt(
    [[---
layout: blog-post.njk
date: {}
permalink: "{}/{}/"
draft: true
tags: [{}]
title: {}
---

{}
<!--more-->]],
    {
      f(
          function()
            return os.date("%Y-%m-%d %H:%M:%S")
          end
        ),
      f(function()
            return os.date("%Y")
        end),
        i(1, "permalink"),
        i(2, "tags"),
        i(3, "title"),
        i(4, "text")
    }
  )
),

  s(
    { trig = "crsswrd", desc= "Crossword snippet"},
    fmt(
    [[
[**{}**]({})

**Solved:** {} \
**Checks:** {} \
**Co-op?:** {} \
**Dictionary used:** {}  \
**Favourite clue:** {} <span class="spoiler">{}</span>\
**Notes:** {}

]],
  {
    i(1, "Name"),
    i(2, "URL"),
    i(3, "Solved?"),
    i(4, "0"),
    i(5, "No"),
    i(6, "No"),
    i(7, "Clue"),
    i(8, "SOLUTION"),
    i(9, "notes")
  }
    )
  ),

  s(
    { trig = '11date',  dscr = 'Date formatted for 11ty'},
    fmt(
      "{}",
      {
       f(
          function()
            return os.date("%Y-%m-%d %H:%M:%S")
          end
        )
      }
    )
  ),
}
