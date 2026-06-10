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

require("telescope").load_extension("fzf")
