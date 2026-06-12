local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s({ trig = '_h', snippetType = 'autosnippet', wordTrig = true },
    { t('^')}),

  s({ trig = 'dm', snippetType = 'autosnippet', wordTrig = true },
    { t({ '$ ', '  ' }), i(1), t({ '', '$ ' }), i(0) }),

  s({ trig = '_su', snippetType = 'autosnippet', wordTrig = false },
    { t('^('), i(1), t(')')}),

  s({ trig = '([%a])(%d)', snippetType = 'autosnippet', regTrig = true, wordTrig = false },
    f(function(_, snip) return snip.captures[1] .. '_' .. snip.captures[2] end)),

  s({ trig = '_sigma', snippetType = 'autosnippet', wordTrig = true },
    { t('sum_('), i(1), t(')^('), i(2), t(') ') }),

  s({ trig = '_integral', snippetType = 'autosnippet', wordTrig = true },
    { t('integral_('), i(1), t(')^('), i(2), t(') ') }),

  s({ trig = '_limes', snippetType = 'autosnippet', wordTrig = true },
    { t('lim_('), i(1), t(' -> '), i(2), t(') ') }),
}
