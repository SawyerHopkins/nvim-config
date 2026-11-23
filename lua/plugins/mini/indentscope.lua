-- Visual indentation guides with scope highlighting
require('mini.indentscope').setup()

-- WinScrolled is a global Neovim event: it fires whenever ANY window's view
-- changes, not just the current one. mini.indentscope redraws immediately on
-- it, so a terminal split (e.g. the Claude toggleterm window) auto-scrolling
-- while output streams in rapidly re-triggers the scope redraw in whichever
-- window you're actually editing, causing visible flashing and main-loop
-- contention. Drop that trigger; CursorMoved/ModeChanged still keep the
-- indicator in sync for normal editing.
vim.api.nvim_clear_autocmds({ group = 'MiniIndentscope', event = 'WinScrolled' })
