return { -- You can easily change to a different colorscheme.
	"navarasu/onedark.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		require("onedark").setup({
			style = "darker",
		})
		require("onedark").load()
	end,
}
