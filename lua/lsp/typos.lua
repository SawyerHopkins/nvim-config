vim.lsp.config('typos_lsp', {
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
    'markdown',
    'html',
  }
})

vim.lsp.enable('typos_lsp')
