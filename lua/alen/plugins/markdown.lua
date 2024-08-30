local M = {
  "OXY2DEV/markview.nvim",
  lazy = false,
}

function M.config()
  local markview = require("markview")

  markview.setup({
    inline_codes = {
      enable = true,
      hl = "DiagnosticOk",

      corner_left = nil,
      corner_left_hl = nil,

      padding_left = " ",
      padding_left_hl = nil,

      padding_right = " ",
      padding_right_hl = nil,

      corner_right = nil,
      corner_right_hl = nil,
    },
    headings = {
      enable = true,
      shift_width = 0,

      heading_1 = {
        style = "label",

        padding_left = " ",
        padding_right = " ",

        corner_right = "",
        corner_right_hl = "Heading1Corner",

        hl = "Heading1",
      },
    },
    highlight_groups = {
      {
        group_name = "Heading1",
        value = {
          fg = "#1e1e2e",
          bg = "#a6e3a1",
        },
      },
      {
        group_name = "Heading1Corner",
        value = {
          fg = "#a6e3a1",
        },
      },
    },
    horizontal_rules = {
      parts = {
        {
          type = "repeating",
          text = "-",

          direction = "left",

          hl = {
            "Gradient1",
            "Gradient2",
            "Gradient3",
            "Gradient4",
            "Gradient5",
            "Gradient6",
            "Gradient7",
            "Gradient8",
            "Gradient9",
            "Gradient10",
          },

          repeat_amount = function()
            local w = vim.api.nvim_win_get_width(0)
            local l = vim.api.nvim_buf_line_count(0)

            l = vim.fn.strchars(tostring(l)) + 4

            return math.floor((w - (l + 3)) / 2)
          end,
        },
        {
          type = "text",
          text = "",
        },
        {
          type = "repeating",
          text = "─",

          direction = "right",
          hl = {
            "Gradient1",
            "Gradient2",
            "Gradient3",
            "Gradient4",
            "Gradient5",
            "Gradient6",
            "Gradient7",
            "Gradient8",
            "Gradient9",
            "Gradient10",
          },

          repeat_amount = function()
            local w = vim.api.nvim_win_get_width(0)
            local l = vim.api.nvim_buf_line_count(0)

            l = vim.fn.strchars(tostring(l)) + 4

            return math.ceil((w - (l + 3)) / 2)
          end,
        },
      },
    },
  })

  vim.cmd([[Markview enableAll]])
end

return M
