local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
}

M.config = function()
  local map = vim.keymap
  -- Todo Comments
  local todo_comments = require("todo-comments")

  todo_comments.setup({})

  map.set("n", "]t", function()
    todo_comments.jump_next()
  end, { desc = "Next Todo Comment" })

  map.set("n", "[t", function()
    todo_comments.jump_prev()
  end, { desc = "Previous Todo Comment" })
end

return M
