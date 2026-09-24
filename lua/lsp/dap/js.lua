local dap = require('dap')
dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.env.JS_DAP_PATH
      "${port}",
      -- "127.0.0.1",
    },
  },
}

for _, language in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact" } do
  dap.configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch File',
      program = '${file}',
      cwd = '${workspaceFolder}',
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach',
      processId = require('utils.dap').pick_process,
      cwd = '${workspaceFolder}',
    }
  }
end

