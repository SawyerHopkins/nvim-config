-- [w]indow keys
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>wx", "<cmd>split<CR>", { desc = "Split horizontal" })

vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close other windows" })

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go right" })

vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equal size" })
vim.keymap.set("n", "<leader>w+", "<cmd>resize +5<CR>", { desc = "Taller" })
vim.keymap.set("n", "<leader>w-", "<cmd>resize -5<CR>", { desc = "Shorter" })
vim.keymap.set("n", "<leader>w>", "<cmd>vertical resize +5<CR>", { desc = "Wider" })
vim.keymap.set("n", "<leader>w<", "<cmd>vertical resize -5<CR>", { desc = "Narrower" })

vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move window left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move window down" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Move window up" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Move window right" })

vim.keymap.set("n", "<leader>wV", "<cmd>vnew<CR>", { desc = "New vertical" })
vim.keymap.set("n", "<leader>wX", "<cmd>new<CR>", { desc = "New horizontal" })

