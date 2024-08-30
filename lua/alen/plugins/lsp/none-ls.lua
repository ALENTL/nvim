local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "nvimtools/none-ls-extras.nvim", event = "VimEnter" },
  },
  event = "VimEnter",
}

M.config = function()
  local null_ls = require("null-ls")
  -- local none_ls = require("none-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,

      -- C/C++ Formatting
      null_ls.builtins.formatting.clang_format.with({
        extra_args = {
          "--style=(AllowShortFunctionsOnASingleLine: false)",
        },
      }),
    },

    on_attach = function(client, bufnr)
      local augroup = vim.api.nvim_create_augroup("NullLsFormat", { clear = true })

      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,

          callback = function()
            vim.lsp.buf.format({ buffer = bufnr })
          end,
        })
      end
    end,
  })
end

return M
