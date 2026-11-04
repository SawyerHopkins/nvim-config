-- More natural page movement
vim.keymap.set({ 'n', 'v' }, '<S-k>', '<C-u>', { desc = 'Half page up', remap = true })
vim.keymap.set({'n', 'v' }, '<S-j>', '<C-d>', { desc = 'Half page down', remap = true })

