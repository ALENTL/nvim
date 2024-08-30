local M = {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
}

M.config = function()
  local comment = require("Comment")

  local opts = {
    padding = true,
    sticky = true,
    ignore = nil,

    toggler = {
      line = "gcc",
      block = "gbc",
    },

    opleader = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },

    mappings = {
      basic = true,
      extra = true,
    },

    pre_hook = nil,
    post_hook = nil,
  }

  comment.setup(opts)
end

return M
