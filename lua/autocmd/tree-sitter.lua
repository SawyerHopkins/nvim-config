local autoCmdUtils = require('utils.autocmd')

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Apply tree-sitter to buffer',
  group = autoCmdUtils.augroup("ts-buf"),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not (lang and vim.treesitter.language.add(lang)) then return end

    vim.treesitter.start(args.buf)
    vim.wo[0][0].foldmethod = 'expr'
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
})
