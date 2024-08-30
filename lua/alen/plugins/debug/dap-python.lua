local M = {
	"mfussenegger/nvim-dap-python",
	event = "VeryLazy",
}

function M.config()
	local dap = require("dap")
	local dp = require("dap-python")
	function PythonPath()
		local cwd = vim.fn.getcwd()

		if vim.fn.executable(cwd .. "/venv/bin/python3") == 1 then
			return cwd .. "/venv/bin/python3"
		elseif vim.fn.executable(cwd .. "/.venv/bin/python3") == 1 then
			return cwd .. "/.venv/bin/python3"
		else
			return "/usr/bin/python3"
		end
	end

	dp.setup(PythonPath())
end

return M
