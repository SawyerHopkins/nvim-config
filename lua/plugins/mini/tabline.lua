-- Tabline showing open buffers/tabs
local mini_tabline = require('mini.tabline')
local miniUtils = require('utils.mini')

mini_tabline.setup({
    show_icons = true,
    format = function(buf_id, label)
        local is_current = buf_id == vim.api.nvim_get_current_buf()
        local is_modified = vim.bo[buf_id].modified
        local prefix = is_current and '* ' or ''
        local suffix = is_modified and ' +' or ''

        return mini_tabline.default_format(buf_id, prefix .. label .. suffix)
    end,
})

-- Adjust immediately and register to adjust after every new color scheme
miniUtils.adjust_tabline_hl()
