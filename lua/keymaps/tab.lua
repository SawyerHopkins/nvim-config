-- [t]tab keys
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close other tabs" })

vim.keymap.set("n", "<leader>th", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabfirst<CR>", { desc = "First tab" })
vim.keymap.set("n", "<leader>te", "<cmd>tablast<CR>", { desc = "Last tab" })

vim.keymap.set("n", "<leader>tL", "<cmd>tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>tH", "<cmd>tabmove -1<CR>", { desc = "Move tab left" })

