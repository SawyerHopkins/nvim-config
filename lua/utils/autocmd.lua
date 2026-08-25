local M = {}

function M.augroup(name)
  return vim.api.nvim_create_augroup("cfg-group-" .. name, { clear = true })
end

return M
