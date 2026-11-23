local autoCmdUtils = require('utils.autocmd')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Attach LSP completion',
  group = autoCmdUtils.augroup("lsp-completion"),
  callback = function (args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
})

