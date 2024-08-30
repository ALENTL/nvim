local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
}

M.config = function()
  local catppuccin = require("catppuccin")

  catppuccin.setup({
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,

    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      dap = true,
      dap_ui = true,
      noice = true,
    },

    custom_highlights = function(colors)
      return {
        CmpBorder = { fg = colors.surface2 },
      }
    end,
  })

  vim.cmd([[colorscheme catppuccin]])
end

return M
