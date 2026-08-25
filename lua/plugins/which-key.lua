--[[
Shows a floating dialog with completion paths for keybindings
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/folke/which-key.nvim' }, { confirm = false })

--[[ SETUP --]]

require('which-key').setup({
  preset = 'modern',
})
