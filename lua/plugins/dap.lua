--[[
Adds base LSP server config
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/mfussenegger/nvim-dap' }, { confirm = false })
vim.pack.add({ 'https://github.com/rcarriga/nvim-dap-ui' }, { confirm = false })
vim.pack.add({ 'https://github.com/nvim-neotest/nvim-nio' }, { confirm = false })
vim.pack.add({ 'https://github.com/rcarriga/nvim-dap-ui' }, { confirm = false })

local dap, dapui = require("dap"), require("dapui")

--[[ SETUP --]]

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual" })

dap.listeners.before.attach.dapui_config = function()
  dapui.open({ reset = true })
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open({ reset = true })
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dapui.setup({
  layouts = {
    {
      position = "left",
      size = 40,
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
    }
  },
})

