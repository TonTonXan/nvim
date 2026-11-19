-- File explorer that edits the filesystem like a buffer
require("oil").setup()

-- Fuzzy finder
require("telescope").setup({
	pickers = {
		git_files = { theme = "ivy" },
		find_files = { theme = "ivy" },
		live_grep = { theme = "ivy" },
	},
})

-- fzf-native requires a one-time manual build; skip gracefully if not yet compiled.
-- See TODO.md for the build command.
local ok, err = pcall(require("telescope").load_extension, "fzf")
if not ok then
	vim.notify("telescope-fzf-native not built (fuzzy matching will be slower).\nSee TODO.md for the build command.", vim.log.levels.WARN)
end

-- Jump to any visible position with s; S selects treesitter nodes.
require("flash").setup()

-- Pin a few files and switch with <leader>1..5.
require("harpoon"):setup()

-- Symbol outline sidebar.
require("aerial").setup()

-- Breadcrumb bar showing the enclosing class and function.
require("dropbar").setup()
