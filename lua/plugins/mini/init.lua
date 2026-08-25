--[[
Installs and configures various tools provided from the mini meta library.
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { confirm = false })

--[[ SETUP --]]

require('plugins.mini.basics')
require('plugins.mini.ai')
require('plugins.mini.comment')
require('plugins.mini.completion')
require('plugins.mini.tabline')
require('plugins.mini.icons')
require('plugins.mini.notify')
require('plugins.mini.starter')
require('plugins.mini.statusline')
require('plugins.mini.bracketed')
require('plugins.mini.cmdline')
require('plugins.mini.diff')
require('plugins.mini.git')
require('plugins.mini.hipatterns')
require('plugins.mini.indentscope')
require('plugins.mini.jump')
require('plugins.mini.jump2d')
require('plugins.mini.keymap')
require('plugins.mini.move')
require('plugins.mini.operators')
require('plugins.mini.pairs')
require('plugins.mini.splitjoin')
require('plugins.mini.surround')
require('plugins.mini.cursorword')
require('plugins.mini.trailspace')
