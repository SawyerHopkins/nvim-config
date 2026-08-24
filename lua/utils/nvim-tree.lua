local M = {}

function M.search_node()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()
  if not node then return end

  local builtin = require("telescope.builtin")

  if node.type == "directory" then
    builtin.live_grep({
      cwd = node.absolute_path,
      prompt_title = "Search in " .. node.name,
    })
  else
    builtin.live_grep({
      search_dirs = { node.absolute_path },
      prompt_title = "Search in " .. node.name,
    })
  end
end

return M
