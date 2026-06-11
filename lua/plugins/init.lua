-- Prevent git from hanging on any credential prompt during plugin installation.
-- All plugin URLs are public repos and need no authentication.
vim.env.GIT_TERMINAL_PROMPT = "0"

-- Use :lua vim.pack.update() to update the plugins
vim.pack.add({

	-- Appearance
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/ntpeters/vim-better-whitespace.git" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

	-- Git related
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- Navigation
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	-- NOTE: telescope-fzf-native requires a manual build step after install:
	--   cd ~/.local/share/nvim/pack/*/start/telescope-fzf-native.nvim && cmake . -B build && cmake --build build
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

	-- Autocompletion
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/fang2hou/blink-copilot" },

	-- LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/p00f/clangd_extensions.nvim" },
	-- rustaceanvim manages rust_analyzer automatically; do not call vim.lsp.enable("rust_analyzer")
	{ src = "https://github.com/mrcjkb/rustaceanvim" },

	-- Debug
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" }, -- required by nvim-dap-ui and neotest
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },

	-- Testing
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/neotest-python" },
	{ src = "https://github.com/rouge8/neotest-rust" },
	{ src = "https://github.com/alfaix/neotest-gtest" },

	-- Language tools
	{ src = "https://github.com/Saecki/crates.nvim" },
	{ src = "https://github.com/linux-cultist/venv-selector.nvim" },
	{ src = "https://github.com/Civitasv/cmake-tools.nvim" },

	-- Utils
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/kylechui/nvim-surround" },

	-- Copilot
	{ src = "https://github.com/github/copilot.vim" },
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
})

