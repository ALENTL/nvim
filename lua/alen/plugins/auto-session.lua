local M = {
  "rmagatti/auto-session",
  event = "VeryLazy",
}

M.config = function()
  local auto_session = require("auto-session")

  auto_session.setup({
    auto_restore_enabled = true,
    auto_session_suppress_dirs = {
      "~/",
      "~/Downloads/",
      "~/Documents/",
      "~/Desktop",
    },
  })

  local map = vim.keymap

  map.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
  map.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
end

return M
