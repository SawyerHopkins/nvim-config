-- First u is the worst possible map for destructive key binding I can image.
-- Second remove undo/redo entirely to favor g-/g+
vim.keymap.set('n', 'u', '<Nop>')
vim.keymap.set('n', '<C-R>', '<Nop>')

