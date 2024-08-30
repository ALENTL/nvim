local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  event = "VeryLazy",
}

M.config = function()
  local dap, dapui = require("dap"), require("dapui")

  dapui.setup({})

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "debugBreakpoint", linehl = "", numhl = "debugBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "debugBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "debugBreakpoint" }
  )
  vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "debugBreakpoint", linehl = "", numhl = "debugBreakpoint" }
  )
  vim.fn.sign_define(
    "DapStopped",
    { text = "", texthl = "debugBreakpoint", linehl = "debugPC", numhl = "DiagnosticSignError" }
  )

  dap.adapters.lldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = "codelldb",
      args = { "--port", "${port}" },
      detached = false,
    },
  }
end

return M
