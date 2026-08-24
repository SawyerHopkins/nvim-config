local builtin = require('telescope.builtin')

-- [l]sp keys
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })

vim.keymap.set({ 'n', 'v' }, "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format" })

vim.keymap.set("n", "<leader>lo", function()
  vim.lsp.buf.code_action({
    apply = true,
    filter = function(action)
      return action.title:match("organize imports") or action.title:match("Organize Imports")
    end,
  })
end, { desc = "Organize imports" })

vim.keymap.set("n", "<leader>lu", function()
  vim.lsp.buf.code_action({
    apply = true,
    filter = function(action)
      return action.title:match("unused") or action.title:match("Remove unused")
    end,
  })
end, { desc = "Remove unused imports" })

vim.keymap.set('n', '<leader>lt', vim.lsp.buf.hover, { desc = 'LSP' })
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>la', function () 
  vim.lsp.buf.code_action({
    filter = function(action)
      if action.disabled then
        return false
      end
      return true
    end,
    apply = false
  })
end, { desc = 'Code Actions' })

