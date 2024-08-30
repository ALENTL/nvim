local M = {
  "declancm/cinnamon.nvim",
  lazy = true,
  version = "*",
}

function M.config()
  local cinnamon = require("cinnamon")

  local opts = {
    disabled = false,

    keymaps = {
      basic = true,
      extra = true,
    },

    options = {
      mode = "cursor",
      delay = 5,
      max_delta = {
        line = false,
        column = false,
        time = 1000,
      },

      step_size = {
        vertical = 1,
        horizontal = 2,
      },

      callback = function() end,
    },
  }

  cinnamon.setup(opts)
end

return M
