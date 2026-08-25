-- Sidebar buffer mini map
local map = require('mini.map')
map.setup({
  -- Use Braille dots to encode text
  symbols = { encode = map.gen_encode_symbols.dot('4x2') },
  -- Show built-in search matches, 'mini.diff' hunks, and diagnostic entries
  integrations = {
    map.gen_integration.builtin_search(),
    map.gen_integration.diff(),
    map.gen_integration.diagnostic(),
  },
})
