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

-- WinScrolled is a global event: it fires whenever ANY window's view
-- changes, not just the current one. mini.map's view-change handler only
-- checks the currently focused buffer, so an unrelated window scrolling
-- (e.g. a terminal split streaming output) forces a map re-encode of
-- whatever you're editing. Same issue as indentscope; same fix.
vim.api.nvim_clear_autocmds({ group = 'MiniMap', event = 'WinScrolled' })
