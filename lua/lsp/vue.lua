vim.lsp.config('vue_ls', {
  init_options = {
    vue = {
      hybridMode = true
    },
    settings = {
      vue = {
        complete = {
          casing = {
            tags = 'pascal',
            props = 'kebab'
          }
        }
      }
    }
  }
})

vim.lsp.enable('vue_ls')
