local common = require('snippets.common')
local s = common.s;
local t = common.t;
local i = common.i;
local fmta = common.fmta
return {
  s(
    {
      trig = "if",
      namr = "If-Statement",
      dscr = "if statement"
    },
    fmta(
      [[
      if (<>) {
        <>
      }
    ]],
      { i(1, 'cond'), i(2, 'then') }
    )
  ),
  s(
    {
      trig = "ifelse",
      namr = "If-else-Statement",
      dscr = "if-else statement"
    },
    fmta(
      [[
      if (<>) {
        <>
      } else {
        <>
      }
    ]],
      { i(1, 'cond'), i(2, 'then'), i(3, 'else') }
    )
  ),
  s(
    {
      trig = "elif",
      namr = "Elseif-Statement",
      dscr = "else-if statement"
    },
    fmta(
      [[
      if (<>) {
        <>
      } else if (<>){
        <>
      } else {
        <>
      }
    ]],
      { i(1, 'cond'), i(2, 'then'), i(3, 'cond'), i(4, 'then'), i(5, 'else') }
    )
  ),
  s(
    {
      trig = "func",
      namr = "Function",
      dscr = "Function declaration"
    },
    fmta(
      [[
      function <>(<>) {
        <>
      }
    ]],
      { i(1, 'name'), i(2, 'args'), i(3, 'body') }
    )
  ),
  s(
    {
      trig = "interface",
      namr = "Interface",
      dscr = "Interface declaration"
    },
    fmta(
      [[
      interface <> {
        <>
      }
    ]],
      { i(1, 'Interface'), i(2, 'property') }
    )
  ),

}
