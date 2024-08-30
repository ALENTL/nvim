local M = {
  "HiPhish/rainbow-delimiters.nvim",
  lazy = true,
}

function M.config()
  local rd = require("rainbow-delimiters")
  local rd_setup = require("rainbow-delimiters-setup")

  rd_setup.setup({
    strategy = {
      [""] = rd.strategy["global"],
      commonlisp = rd.strategy["local"],
    },

    query = {
      [""] = "rainbow-delimiters",
      latex = "rainbow-blocks",
    },

    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  })
end

return M
