local M = {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
}

M.config = function()
  local opts = {
    border = "curved",
  }

  local term = require("toggleterm")

  term.setup(opts)
end

return M
