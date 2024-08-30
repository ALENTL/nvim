local spec = {
  "jay-babu/mason-null-ls.nvim",
  event = "VeryLazy",
}

function spec.config()
  local mnl = require("mason-null-ls")

  mnl.setup({
    ensure_installed = nil,
    automatic_installation = true,
  })
end

return spec
