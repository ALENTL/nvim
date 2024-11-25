local M = {
  "rcarriga/nvim-notify",
}

M.config = function()
  require("notify").setup({
    background_color = "FloatShadow",
    timeout = 3000,
  })
  vim.notify = require("notify")
end

return M
