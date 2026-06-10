-- Which-key: show pending keybindings popup
require("which-key").setup()
require("which-key").add({
	{ "<leader>b", group = "Buffers" },
	{ "<leader>c", group = "Copilot" },
	{ "<leader>C", group = "Crates (Cargo.toml)" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>f", group = "Find (telescope)" },
	{ "<leader>g", group = "Git" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>m", group = "CMake" },
	{ "<leader>n", group = "Neotest" },
	{ "<leader>p", group = "Python" },
	{ "<leader>s", group = "Splits" },
	{ "<leader>t", group = "Todo" },
	{ "<leader>x", group = "Trouble" },
})

-- Highlighted TODO/FIXME/NOTE/HACK/WARN comments
require("todo-comments").setup()

-- Auto-close brackets and quotes
require("nvim-autopairs").setup()

-- ys{motion}{char} add, ds{char} delete, cs{old}{new} change surrounding pairs
require("nvim-surround").setup()
