-- Enhanced text objects (e.g., around/inside functions, arguments, etc.)
local gen_ai_spec = require('mini.extra').gen_ai_spec
local ai = require('mini.ai')

ai.setup({
  custom_textobjects = {
    B = gen_ai_spec.buffer(),
    D = gen_ai_spec.diagnostic(),
    I = gen_ai_spec.indent(),
    L = gen_ai_spec.line(),
    N = gen_ai_spec.number(),
    F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    C = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
    o = ai.gen_spec.treesitter({
      a = { '@conditional.outer', '@loop.outer' },
      i = { '@conditional.inner', '@loop.inner' },
    })
  },
  search_method = cover
})
