local M = {}

function M.copy_and_invert (to, from)
  local from_hl = vim.api.nvim_get_hl(0, { name = from, link = false })
  local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
  -- Fall back to Normal group attributes if the reference does not define
  -- both `fg` and `bg`. NOTE: Can not work with transparent color schemes.
  vim.api.nvim_set_hl(0, to, { fg = from_hl.bg or normal_hl.bg, bg = from_hl.fg or normal_hl.fg })
end

return M
