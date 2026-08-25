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

vim.enable('typos_lsp')
