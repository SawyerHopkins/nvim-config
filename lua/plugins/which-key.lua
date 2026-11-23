--[[
Shows a floating dialog with completion paths for keybindings
--]]

--[[ INSTALL --]]

vim.pack.add({ 'https://github.com/folke/which-key.nvim' }, { confirm = false })

--[[ SETUP --]]

require('which-key').setup({
  preset = 'modern',
  triggers = {
    { "<auto>", mode = "nxso" },
    { "s", mode = { "n", "x" } },
  }
})

--[[ GROUP DESCRIPTIONS --]]

require('which-key').add({
  { "<leader>b", group = "Buffer" },
  { "<leader>c", group = "Claude" },
  { "<leader>d", group = "Debug" },
  { "<leader>f", group = "File" },
  { "<leader>g", group = "Git" },
  { "<leader>l", group = "LSP" },
  { "<leader>m", group = "Minimap" },
  { "<leader>r", group = "Replace" },
  { "<leader>s", group = "Search" },
  { "<leader>sl", group = "Search LSP" },
  { "<leader>t", group = "Tab" },
  { "<leader>w", group = "Window" },
  { "s", group = "Surround", mode = { "n", "x" } },
})
