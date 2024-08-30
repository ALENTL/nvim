local M = {
  "leoluz/nvim-dap-go",
  event = "VeryLazy",
}

function M.config()
  local dap_go = require("dap-go")

  dap_go.setup({
    dap_configurations = {
      {
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
    },

    delve = {
      path = "dlv",
      initialize_timeout_sec = 20,
      port = "${port}",
      args = {},
      build_flags = {},
      detached = vim.fn.has("win32") == 0,
      cwd = nil,
    },

    tests = {
      verbose = false,
    },
  })
end

return M
