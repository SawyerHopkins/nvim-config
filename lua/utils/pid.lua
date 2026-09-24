local M = {}

function M.get_processes(opts)
  opts = opts or {}
  local separator = ' \\+'
  local command = {'ps', '-a', '-f'}

  local get_pid = function (parts)
    return parts[2]
  end

  local get_process_name = function (parts)
    return table.concat({unpack(parts, 8)}, ' ')
  end

  local output = vim.fn.system(command)
  local lines = vim.split(output, '\n')
  local procs = {}

  local nvim_pid = vim.fn.getpid()
  for _, line in pairs(lines) do
    if line ~= "" then -- tasklist command outputs additional empty line in the end
      local parts = vim.fn.split(vim.fn.trim(line), separator)
      local pid, name = get_pid(parts), get_process_name(parts)
      pid = tonumber(pid)
      if pid and pid ~= nvim_pid then
        table.insert(procs, { pid = pid, name = name })
      end
    end
  end

  if opts.filter then
    local filter
    if type(opts.filter) == "string" then
      filter = function(proc)
        return proc.name:find(opts.filter)
      end
    elseif type(opts.filter) == "function" then
      filter = function(proc)
        return opts.filter(proc)
      end
    else
      error("opts.filter must be a string or a function")
    end
    procs = vim.tbl_filter(filter, procs)
  end

  return procs
end

return M
