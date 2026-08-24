--[[
Shows a floating dialog with completion paths for keybindings
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/folke/which-key.nvim' }, { confirm = false })

--[[ SETUP --]]

local which_key = require('which-key')
which_key.setup({
  preset = 'modern',
})
