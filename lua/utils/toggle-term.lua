local M = {}

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")

    -- Pass through esc to lazygit. Exit lazygit with q.
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function()
    vim.cmd("startinsert!")
  end,
})

function M.toggle_lazy_git()
  lazygit:toggle()
end

return M

