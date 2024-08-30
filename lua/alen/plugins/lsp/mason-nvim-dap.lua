local spec = {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
}

function spec.config()
  local mnd = require("mason-nvim-dap")
  mnd.setup({})
end

return spec
