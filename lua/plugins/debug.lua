local dap = require("dap")
local dapui = require("dapui")

-- mason-nvim-dap installs and wires debug adapters from Mason.
require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb", "debugpy" },
	automatic_installation = true,
})

-- DAP UI opens automatically when a session starts and closes when it ends.
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- codelldb adapter for C, C++, and Rust.
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}

local codelldb_config = {
	{
		name = "Launch executable",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
	{
		name = "Attach to process",
		type = "codelldb",
		request = "attach",
		pid = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
	},
}

-- Deep copy so that DAP cannot mutate one filetype's config through another's reference.
dap.configurations.c    = vim.deepcopy(codelldb_config)
dap.configurations.cpp  = vim.deepcopy(codelldb_config)
dap.configurations.rust = vim.deepcopy(codelldb_config)

-- debugpy adapter for Python; uses the active venv's interpreter when venv-selector is configured.
require("dap-python").setup()
