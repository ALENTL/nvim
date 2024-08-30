return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    local parsers = require("nvim-treesitter.parsers")
    function _G.ensure_treesitter_language_installed()
      local lang = parsers.get_buf_lang()
      if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
        vim.schedule_wrap(function()
          vim.cmd("TSInstall " .. lang)
        end)()
      end
    end

    vim.cmd([[autocmd FileType * :lua ensure_treesitter_language_installed()]]) -- configure treesitter
    treesitter.setup({
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = false },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "java",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
