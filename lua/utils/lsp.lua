local M = {}

function M.source_action(kind)
  return function()
    vim.lsp.buf.code_action({ apply = true, context = { only = { kind }, diagnostics = {} } })
  end
end

return M

