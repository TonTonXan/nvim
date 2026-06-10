-- Onedark theme
local onedark = require("onedark")
onedark.setup({
	style = "deep",
	transparent = false,
	term_colors = true,
	ending_tildes = true,
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "bold",
		strings = "none",
		variables = "none",
	},
})
onedark.load()

-- Statusline
require("lualine").setup({
	options = { theme = "onedark" },
})

-- Syntax highlighting and parsing
require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"bitbake",
		"devicetree",
		"dockerfile",
		"json",
		"lua",
		"make",
		"markdown",
		"python",
		"rst",
		"rust",
		"toml",
		"yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

-- Treesitter text objects (select/move by function, class, parameter)
require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_prev_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
		},
	},
})

-- Diagnostics panel
require("trouble").setup()

-- Visual indent guides
require("ibl").setup()

-- File type icons
require("nvim-web-devicons").setup()
