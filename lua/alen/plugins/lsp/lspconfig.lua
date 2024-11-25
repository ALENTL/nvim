return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    local border = {
      { "┌", "FloatBorder" },
      { "─", "FloatBorder" },
      { "┐", "FloatBorder" },
      { "│", "FloatBorder" },
      { "┘", "FloatBorder" },
      { "─", "FloatBorder" },
      { "└", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", function()
          --vim.diagnostic.jump({ count = -1, float = true })
          vim.diagnostic.goto_prev()
        end, opts)

        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_next()
          -- vim.diagnostic.config({ jump = { float = true } })
        end, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "󰠠",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      virtual_text = {
        prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
      },
      update_in_insert = true,
      underline = true,
      severity_sort = false,
    })

    mason_lspconfig.setup_handlers({
      ["clangd"] = function()
        lspconfig["clangd"].setup({
          capabilities = capabilities,
          handlers = handlers,
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
          end,
        })
      end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          handlers = handlers,
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          handlers = handlers,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
          end,
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          handlers = handlers,
          capabilities = capabilities,
          filetypes = {
            "html",
            "pug",
            "typescriptreact",
            "javascript",
            "javascriptreact",
            "vue",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          handlers = handlers,
          settings = {
            Lua = {
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                maxPreload = 100,
                checkThirdParty = false,
                exclude = {
                  "*/node_modules",
                  "*/vendor",
                  "*/build",
                },
              },
              telemetry = {
                enable = false,
              },
              diagnostics = {
                globals = { "vim" },
                undefined_global = false,
                missing_parameters = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["pyright"] = function()
        lspconfig["pyright"].setup({
          handlers = handlers,
          settings = {
            pyright = {
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                ignore = {
                  "*",
                },
              },
            },
          },
        })
      end,
      ["ruff"] = function()
        lspconfig["ruff"].setup({
          handlers = handlers,
          on_attach = function(client, bufnr)
            if client.name == "ruff" then
              client.server_capabilities.hoverProvider = false
              vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
            end
          end,
        })
      end,
      ["gopls"] = function()
        lspconfig["gopls"].setup({
          handlers = handlers,
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = "*.go",
              callback = function()
                local params = vim.lsp.util.make_range_params()
                params.context = {
                  only = {
                    "source.organizeImports",
                  },
                }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                  for _, r in pairs(res.result or {}) do
                    if r.edit then
                      -- local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                      vim.lsp.util.apply_workspace_edit(r.edit, enc)
                    end
                  end
                end
                vim.lsp.buf.format({ async = false })
              end,
            })
          end,
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        })
      end,
      ["zls"] = function()
        lspconfig["zls"].setup({
          handlers = handlers,
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
          end,
        })
      end,
      ["asm_lsp"] = function()
        lspconfig["asm_lsp"].setup({
          handlers = handlers,
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
          end,
        })
      end,
      ["serve_d"] = function()
        lspconfig["serve_d"].setup({
          handlers = handlers,
          capabilities = capabilities,
          settings = {
            dfmt = {
              braceStyle = "stroustrup",
            },
          },
          on_attach = function(client, bufnr)
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
          end,
        })
      end,
    })
  end,
}
