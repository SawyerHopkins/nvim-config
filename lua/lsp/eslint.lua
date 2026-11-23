local lspUtils = require('utils.lsp')

vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue'
  },
  root_markers = {
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    'eslint.config.ts',
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    'package.json',
  },
  settings = {
    workingDirectory = { mode = 'auto' },
  },
  on_attach = function (client, bufnr)
    vim.keymap.set("n", "<leader>ll", lspUtils.source_action("source.fixAll.eslint"), { desc = "Lint", buffer = bufnr })
  end
})

vim.lsp.enable('eslint')
