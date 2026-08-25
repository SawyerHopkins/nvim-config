-- [f]ile keys
vim.keymap.set('n', '<leader>fg', '<cmd>NvimTreeFindFile<CR>', { desc = 'Expand to file' })
vim.keymap.set('n', '<leader>fr', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh explorer' })
vim.keymap.set('n', '<leader>fe', '<cmd>NvimTreeToggle<CR>', { desc = 'File explorer' })
vim.keymap.set("n", "<leader>fh", require("undotree").open, { desc = 'File history' })

