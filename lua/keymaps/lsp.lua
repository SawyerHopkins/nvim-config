local dap = require('dap')
local dapui = require('dapui')

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

vim.keymap.set('n', '<leader>lt', vim.lsp.buf.hover, { desc = 'Hover' })
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

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Debug: Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Debug: Toggle REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
vim.keymap.set("n", "<leader>du", function() dapui.toggle({ reset = true }) end, { desc = "Debug: Toggle UI" })
vim.keymap.set("n", "<leader>do", function() dapui.open({ reset = true }) end, { desc = "Debug: Open UI" })
vim.keymap.set("n", "<leader>di", dapui.eval, { desc = "Debug: Inspect" })

