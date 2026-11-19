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

-- Pin the signature of the current function or class at the top of the window.
require("treesitter-context").setup({ max_lines = 3 })

-- Treesitter text objects (nvim-treesitter-textobjects main branch: keymaps are set by hand).
require("nvim-treesitter-textobjects").setup({
	select = { lookahead = true },
	move = { set_jumps = true },
})

local select_object = require("nvim-treesitter-textobjects.select").select_textobject
local move = require("nvim-treesitter-textobjects.move")

for lhs, query in pairs({
	af = "@function.outer",
	["if"] = "@function.inner",
	ac = "@class.outer",
	ic = "@class.inner",
	aa = "@parameter.outer",
	ia = "@parameter.inner",
}) do
	vim.keymap.set({ "x", "o" }, lhs, function()
		select_object(query, "textobjects")
	end, { desc = "Select " .. query })
end

for lhs, spec in pairs({
	["]f"] = { move.goto_next_start, "@function.outer" },
	["]c"] = { move.goto_next_start, "@class.outer" },
	["[f"] = { move.goto_previous_start, "@function.outer" },
	["[c"] = { move.goto_previous_start, "@class.outer" },
}) do
	vim.keymap.set({ "n", "x", "o" }, lhs, function()
		spec[1](spec[2], "textobjects")
	end, { desc = "Goto " .. spec[2] })
end

-- Diagnostics panel
require("trouble").setup()

-- Visual indent guides
require("ibl").setup()

-- File type icons
require("nvim-web-devicons").setup()
