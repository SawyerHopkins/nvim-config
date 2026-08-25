vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      keyOrdering = false,
      schemaStore = { enable = true },
    },
  },
})

vim.lsp.enable('yamlls')
