-- LSP progress spinner in the corner
require("fidget").setup()

-- Mason: installs LSP servers, formatters, and linters
require("mason").setup()

-- Bridge between Mason-installed servers and vim.lsp.enable.
-- automatic_enable = true calls vim.lsp.enable() for all mason-installed servers.
require("mason-lspconfig").setup({ automatic_enable = true })

-- Explicit enables cover servers installed outside of Mason (e.g. distro packages).
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")

-- clangd needs --query-driver to find the system headers of a cross toolchain.
-- Set it at runtime with :ClangdQueryDriver <glob>; the value persists across sessions.
local query_driver_file = vim.fn.stdpath("state") .. "/clangd_query_driver"

local function clangd_cmd(query_driver)
	local cmd = { "clangd", "--background-index", "--header-insertion=never" }
	if query_driver and query_driver ~= "" then
		table.insert(cmd, "--query-driver=" .. query_driver)
	end
	return cmd
end

local saved_driver = vim.fn.filereadable(query_driver_file) == 1 and vim.fn.readfile(query_driver_file)[1] or nil
vim.lsp.config("clangd", { cmd = clangd_cmd(saved_driver) })

local function set_query_driver(driver)
	if not driver or driver == "" then
		return
	end
	vim.fn.writefile({ driver }, query_driver_file)
	vim.lsp.config("clangd", { cmd = clangd_cmd(driver) })
	vim.cmd("LspRestart clangd")
end

-- Without an argument, prompt for the path with file completion (Tab).
vim.api.nvim_create_user_command("ClangdQueryDriver", function(args)
	if args.args ~= "" then
		set_query_driver(args.args)
		return
	end
	vim.ui.input({
		prompt = "Cross compiler path or glob (e.g. /opt/x/bin/*g++): ",
		default = saved_driver or "",
		completion = "file",
	}, set_query_driver)
end, { nargs = "?", complete = "file", desc = "Set the clangd --query-driver glob and restart clangd" })

-- Do NOT call vim.lsp.enable("rust_analyzer") here; rustaceanvim manages it.

-- lua_ls needs the Neovim runtime in its workspace library to resolve vim.* globals.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")

-- Extra clangd features: inlay hints, memory usage view, AST view, switch header/source
require("clangd_extensions").setup()

-- Formatter config
require("conform").setup({
	formatters_by_ft = {
		lua    = { "stylua" },
		python = { "ruff_format" },
		c      = { "clang_format" },
		cmake  = { "cmake_format" },
		cpp    = { "clang_format" },
		rust   = { "rustfmt" },
		yaml   = { "yamlfmt" },
		bash   = { "shfmt" },
		sh     = { "shfmt" },
		toml   = { "taplo" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style=file", "--fallback-style=LLVM" },
		},
	},
})

-- Linter config.
-- clang-tidy requires compile_commands.json in the project root to resolve includes.
-- Generate it with: cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ...
-- nvim-lint has no setup(); linters are configured by assigning linters_by_ft directly.
local lint = require("lint")
lint.linters_by_ft = {
	c      = { "clangtidy" },
	cpp    = { "clangtidy" },
	python = { "ruff" },
	bash   = { "shellcheck" },
	sh     = { "shellcheck" },
}

-- Completion with LSP, path, snippets, and buffer sources
require("blink.cmp").setup({
	completion = {
		list = { selection = { preselect = false, auto_insert = true } },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
