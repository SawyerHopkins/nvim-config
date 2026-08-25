local hlUtils = require('utils.hl')

local M = {}

function M.adjust_tabline_hl ()
  hlUtils.copy_and_invert('MiniTablineModifiedCurrent', 'MiniTablineCurrent')
  hlUtils.copy_and_invert('MiniTablineModifiedVisible', 'MiniTablineVisible')
  hlUtils.copy_and_invert('MiniTablineModifiedHidden', 'MiniTablineHidden')
end

return M
