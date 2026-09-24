--[[
Provides support for persistent splittable terminals
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' }, { confirm = false })

--[[ SETUP --]]

require('toggleterm').setup({
  shell = vim.o.shell,
  direction = 'vertical',
  open_mapping = { [[<c-\>]] },
  persist_size = false,
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return math.floor(vim.o.columns * 0.2)
    end
  end
})

