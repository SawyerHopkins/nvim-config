--[[
Adds explorer sidebar buffer
--]]

--[[ INSTALL --]]

vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" }, { confirm = false })

--[[ SETUP --]]

local nvimTreeUtils = require('utils.nvim-tree')

require('nvim-tree').setup({
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
  modified = {
    enable = true,
    show_on_dirs = true
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- your custom mapping
    vim.keymap.set("n", "<leader>s", nvimTreeUtils.search_node, opts('Live Grep'))
  end
})
