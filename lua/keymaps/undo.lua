-- Do not accidentally undo when moving around page
vim.keymap.set('n', '<S-k>', '<C-u>', { desc = 'Half page up', remap = true })
vim.keymap.set('n', '<S-j>', '<C-d>', { desc = 'Half page down', remap = true })

