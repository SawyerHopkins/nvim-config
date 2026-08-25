local autoCmdUtils = require('utils.autocmd')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Apply LSP buffer autocommands',
  group = autoCmdUtils.augroup("lsp-buf-au"),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        desc = 'Auto apply eslint fix on save',
        group = autoCmdUtils.augroup("lsp-buf-au"),
        buffer = args.buf,
        command = 'LspEslintFixAll',
      })
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Attach LSP completion',
  group = autoCmdUtils.augroup("lsp-completion"),
  callback = function (args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
})

