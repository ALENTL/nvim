local M = {
  "tomasky/bookmarks.nvim",
  event = "VeryLazy",
}

function M.config()
  local bookmarks = require("bookmarks")
  local map = vim.keymap
  local opts = {
    save_file = vim.fn.expand("$HOME/.bookmarks"),
    keywords = {
      ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
      ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
    },

    on_attach = function(bufnr)
      local bookmarks = require("bookmarks")
      local map = vim.keymap

      map.set("n", "<leader>mm", function()
        bookmarks.bookmark_toggle() -- add or remove bookmark at current line
      end, { desc = "Add/Remove bookmark at current line" })

      map.set("n", "<leader>mi", function()
        bookmarks.bookmark_ann()
      end, { desc = "Add/Edit mark annotation at current line" }) -- add or edit mark annotation at current line

      map.set("n", "<leader>mc", function()
        bookmarks.bookmark_clean()
      end, { desc = "Clear all bookmarks in current file" }) -- clean all marks in local buffer

      map.set("n", "<leader>mn", function()
        bookmarks.bookmark_next()
      end, { desc = "Jump to next bookmark" }) -- jump to next mark in local buffer

      map.set("n", "<leader>mp", function()
        bookmarks.bookmark_prev()
      end, { desc = "Jump to previous bookmark" }) -- jump to previous mark in local buffer

      map.set("n", "<leader>ml", function()
        bookmarks.bookmark_list()
      end, { desc = "List all bookmarks" }) -- show marked file list in quickfix window

      map.set("n", "<leader>mx", function()
        bookmarks.bookmark_clear_all()
      end, { desc = "Remove all bookmarks" }) -- removes all bookmarks
    end,
  }

  bookmarks.setup(opts)
end

return M
