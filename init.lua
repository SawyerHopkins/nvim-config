vim.cmd('packadd nvim.undotree')
vim.cmd('packadd nohlsearch')

require('config')
require('plugins')
require('lsp')
require('keymaps')
require('autocmd')
