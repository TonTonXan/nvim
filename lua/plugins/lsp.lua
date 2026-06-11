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
vim.lsp.enable("cmake")
vim.lsp.enable("yamlls")
vim.lsp.enable("bashls")
vim.lsp.enable("taplo")
vim.lsp.enable("jsonls")
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

-- Completion with LSP, path, snippets, buffer, and Copilot sources
require("blink.cmp").setup({
	completion = {
		list = { selection = { preselect = false, auto_insert = true } },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},
})
