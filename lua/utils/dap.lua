local M = {}
local pid = require('utils.pid')

local function trim_procname(name, columns, wordlimit)
  if #name <= columns then
    return name
  end

  local function trimpart(part, i)
    if #part <= wordlimit then
      return part
    end
    -- `/usr/bin/cmd` -> `cmd`
    part = part:gsub("(/?[^/]+/)", "")

    -- preserve command name in full length, but trim arguments if they exceed word limit
    if i > 1 and #part > wordlimit then
      return "‥" .. part:sub(#part - wordlimit)
    end
    return part
  end

  -- proc name can include arguments `foo --bar --baz`
  -- trim each element and drop trailing args if still too long
  local i = 0
  local parts = {}
  local len = 0
  for word in name:gmatch("[^%s]+") do
    i = i + 1
    local trimmed = trimpart(word, i)
    len = len + #trimmed
    if i > 1 and len > columns then
      table.insert(parts, "[‥]")
      break
    else
      table.insert(parts, trimmed)
    end
  end
  return i > 0 and table.concat(parts, " ") or trimpart(name, 1)
end

function M.pick_process(opts)
  opts = opts or {}
  local cols = math.max(14, math.floor(vim.o.columns * 0.7))
  local wordlimit = math.max(10, math.floor(cols / 3))
  local label_fn = opts.label or function(proc)
    local name = trim_procname(proc.name, cols, wordlimit)
    return string.format("id=%d name=%s", proc.pid, name)
  end
  local procs = pid.get_processes(opts)
  local co, ismain = coroutine.running()
  local ui = require("dap.ui")
  local pick = (co and not ismain) and ui.pick_one or ui.pick_one_sync
  local result = pick(procs, opts.prompt or "Select process: ", label_fn)
  return result and result.pid or require("dap").ABORT
end

return M
