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
