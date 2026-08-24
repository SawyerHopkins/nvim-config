local bufremove = require('mini.bufremove')

-- [b]uffer keys
vim.keymap.set("n", "<leader>bc", function()
  bufremove.delete()
end, { desc = "Close buffer" })

vim.keymap.set("n", "<leader>bC", function()
  bufremove.delete(0, true)
end, { desc = "Close buffer (Force)" })

