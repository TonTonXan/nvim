-- Use :lua vim.pack.update() to update the plugins
vim.pack.add({

	-- Appearance
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/ntpeters/vim-better-whitespace.git" },

	-- Git related
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- Navigation
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },

	-- Autocompletion
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },

	-- LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Utils
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

-- Onedark theme config
local onedark = require("onedark")
onedark.setup({
	style = "deep",
	transparent = false,
	term_colors = true,
	ending_tildes = true,
	cmp_itemkind_reverse = false,

	-- Change code style
	-- Options are italic, bold, underline, none. They can stack
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "bold",
		strings = "none",
		variables = "none",
	},

	-- lualine = { transparent = false },
})
onedark.load()

-- Lualine config
local lualine = require("lualine")
lualine.setup({
	options = {
		theme = "onedark",
	},
})

-- Trouble config
require("trouble").setup()

-- Treesitter config
require("nvim-treesitter").setup({
	ensure_installed = {
		"c",
		"cpp",
		"python",
		"lua",
		"bash",
		"make",
		"cmake",
		"bitbake",
		"devicetree",
		"markdown",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

-- Gitsigns config
require("gitsigns").setup()

-- Oil config
require("oil").setup()

-- Blink config -> completion plugin
require("blink-cmp").setup({
	completion = {
		list = { selection = { preselect = false, auto_insert = true } },
	},
})

-- LSP config
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("stylua")

-- Mason setup
require("mason").setup()

-- Nvim webdev icons
require("nvim-web-devicons").setup()

-- Conform config
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		c = { "clang_format" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style=file", "--fallback-style=LLVM" },
		},
	},
})

-- Todocomments
require("todo-comments").setup()
