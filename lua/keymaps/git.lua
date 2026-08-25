local builtin = require('telescope.builtin')
local toggleTermUtils = require('utils.toggle-term')

-- [g]it keys
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = 'Git buffer commits' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = 'Git stash' })
vim.keymap.set('n', '<leader>gl', toggleTermUtils.toggle_lazy_git, { remap = false, desc = 'Lazy Git' })
vim.keymap.set({ 'n', 'x' }, '<leader>gi', function ()
  MiniGit.show_at_cursor()
end, { remap = false, desc = 'Git diff' })

vim.keymap.set('n', '<localleader>g', MiniDiff.toggle_overlay, { desc = 'Toggle Git Overlay' })


