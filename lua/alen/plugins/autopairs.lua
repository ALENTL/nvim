local M = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    -- config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
}

function M.config()
	local autopairs = require("nvim-autopairs")
	local cmp = require("cmp")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local handlers = require("nvim-autopairs.completion.handlers")

	cmp.event:on(
		'confirm_done',
		cmp_autopairs.on_confirm_done()
	)

	autopairs.setup({
		filetypes = {
			["*"] = {
				["("] = {
					cmp.lsp.CompletionItemKind.Function,
					cmp.lsp.CompletionItemKind.Method,
				},

				handler = handlers["*"]
			}
		},
	})

end

return M
