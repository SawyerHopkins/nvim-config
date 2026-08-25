--[[
Adds (fuzzy) search functionality for various providers (buffers, lsp, git)
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' }, { confirm = false })
vim.pack.add({ 'https://github.com/nvim-telescope/telescope.nvim' }, { confirm = false })
vim.pack.add({ 'https://github.com/nvim-telescope/telescope-ui-select.nvim' }, { confirm = false })

--[[ SETUP --]]

require('telescope').setup({
  extensions = {
    ["ui-select"] = {
      require('telescope.themes').get_dropdown({})
    }
  },
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["<leader>sg"] = sendToGrep
        }
      }
    }
  }
})

require("telescope").load_extension("ui-select")

