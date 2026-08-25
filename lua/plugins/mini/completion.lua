-- Toggle comments easily (line/block commenting)
local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }

require('mini.completion').setup({
  lsp_completion = {
    source_func = 'omnifunc',
    auto_setup = false,
    process_items = function(items, base)
      return MiniCompletion.default_process_items(items, base, process_items_opts)
    end
  }
})

vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
