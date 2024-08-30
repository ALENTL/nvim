local M = {
  "julianolf/nvim-dap-lldb",
  dependencies = { "mfussenegger/nvim-dap" },
  event = "VeryLazy",
}

M.config = function()
  local cfg = {
    configurations = {
      -- C lang configurations
      c = {
        {
          name = "Launch debugger",
          type = "lldb",
          request = "launch",
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          stopOnEntry = false,
          args = {},
          runInTerminal = true,
        },
      },

      rust = {
        {
          name = "Launch Debugger",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      },

      zig = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = "${workspaceFolder}/zig-out/bin/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
          "file",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      },
    },
  }

  require("dap-lldb").setup(cfg)
end

return M
