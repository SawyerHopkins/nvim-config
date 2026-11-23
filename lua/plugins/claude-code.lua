vim.pack.add({ 'https://github.com/coder/claudecode.nvim' }, { confirm = false })

local claude_direction = nil

local claude_term -- the toggleterm Terminal running Claude, if any

local function claude_alive()
  return claude_term ~= nil and claude_term.bufnr ~= nil and vim.api.nvim_buf_is_valid(claude_term.bufnr)
end

local function focus_claude(cfg)
  claude_term:focus()
  if cfg.auto_insert ~= false then
    vim.cmd('startinsert')
  end
end

local function open_claude(cmd, env, cfg, focus)
  local prev_win = vim.api.nvim_get_current_win()

  if not claude_alive() then
    -- toggleterm runs commands through your shell, so quote each argument
    -- (keeps model names like `opus[1m]` from being globbed by zsh).
    local argv = require('claudecode.utils').parse_command(cmd)
    claude_term = require('toggleterm.terminal').Terminal:new({
      cmd = table.concat(vim.tbl_map(vim.fn.shellescape, argv), ' '),
      env = env, -- tells Claude how to connect back to Neovim
      dir = cfg.cwd,
      direction = claude_direction,
      display_name = 'Claude', -- how it shows up in :TermSelect
      close_on_exit = cfg.auto_close ~= false,
      on_open = function(t)
        vim.api.nvim_buf_set_keymap(t.bufnr, "t", "<esc>", "<esc>", {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(t.bufnr, 't', '<C-q>', [[<C-\><C-n>]], {noremap = true, silent = true})
      end,
      on_exit = function(t)
        if claude_term == t then
          claude_term = nil
        end
      end,
    })
  end

  if not claude_term:is_open() then
    local size = claude_term.direction == 'vertical' and math.floor(vim.o.columns * cfg.split_width_percentage) or nil
    claude_term:open(size)
  end

  if focus == false then
    -- Shown in the background (e.g. after sending a selection): stay where you were.
    if vim.api.nvim_win_is_valid(prev_win) then
      vim.api.nvim_set_current_win(prev_win)
    end
    vim.cmd('stopinsert')
  else
    focus_claude(cfg)
  end
end

local toggleterm_provider = {
  setup = function() end,

  is_available = function()
    return (pcall(require, 'toggleterm.terminal'))
  end,

  open = open_claude,

  close = function()
    if not claude_term then
      return
    end
    local t = claude_term
    claude_term = nil
    if t.job_id then
      pcall(vim.fn.jobstop, t.job_id)
      vim.fn.jobwait({ t.job_id }, 1000)
    end
    t:shutdown()
  end,

  simple_toggle = function(cmd, env, cfg)
    if claude_alive() and claude_term:is_open() then
      claude_term:close()
    else
      open_claude(cmd, env, cfg, true)
    end
  end,

  focus_toggle = function(cmd, env, cfg)
    if claude_alive() and claude_term:is_open() then
      if claude_term:is_focused() then
        claude_term:close()
      else
        focus_claude(cfg)
      end
    else
      open_claude(cmd, env, cfg, true)
    end
  end,

  get_active_bufnr = function()
    return claude_alive() and claude_term.bufnr or nil
  end,
}

require('claudecode').setup({
  terminal = {
    provider = toggleterm_provider,
    split_width_percentage = 0.2
  },

  diff_opts = {
    layout = 'unified'
  }
})
