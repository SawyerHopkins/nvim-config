local miniUtils = require('utils.mini')
local autoCmdUtils = require('utils.autocmd')

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Apply color scheme patches',
  group = autoCmdUtils.augroup("color-scheme-patch"),
  callback = miniUtils.adjust_tabline_hl
})
