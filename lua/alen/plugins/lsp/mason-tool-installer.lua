local spec = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
}

function spec.config()
  local mts = require("mason-tool-installer")

  mts.setup({
    ensure_installed = {
      "clangd",
      "clang-format",
      "codelldb",
      "delve",
      "gopls",
      "java-debug-adapter",
      "java-test",
      "jdtls",
      "lua-language-server",
      "pyright",
      "ruff-lsp",
      "stylua",
      "zls",
    },

    auto_update = true,

    run_on_start = true,
    start_delay = 30000,

    integrations = {
      ["mason-lspconfig"] = true,
      -- ["mason-null-ls"] = true,
      -- ["mason-nvim-dap"] = true,
    },
  })
end

return spec
