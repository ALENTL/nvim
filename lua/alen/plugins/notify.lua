local M = {
  "rcarriga/nvim-notify",
}

M.config = function()
  vim.notify = require("notify")

  vim.notify.setup({
    timeout = 1000,
  })
end

return M
