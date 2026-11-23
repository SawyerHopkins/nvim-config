--[[
Adds base LSP server config
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' }, { confirm = false })
vim.pack.add({ 'https://github.com/antosha417/nvim-lsp-file-operations' }, { confirm = false })

require("lsp-file-operations").setup()

vim.lsp.config("*", {
  capabilities = require("lsp-file-operations").default_capabilities(),
})
