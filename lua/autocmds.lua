local map = vim.keymap.set
-- clear = true ensures autocmds are not duplicated when the config is re-sourced.
local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	desc = "Briefly highlight yanked text.",
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	desc = "Enable inlay hints when an LSP attaches to a buffer.",
	callback = function(ev)
		vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	desc = "Format on save; falls back to LSP formatting when no conform formatter is configured.",
	callback = function(ev)
		require("conform").format({ bufnr = ev.buf, lsp_format = "fallback" })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	group = group,
	desc = "Run linters after saving and after reading a buffer.",
	callback = function()
		require("lint").try_lint()
	end,
})

-- Register crates.nvim buffer-local keymaps only when editing Cargo.toml.
vim.api.nvim_create_autocmd("BufRead", {
	group = group,
	pattern = "Cargo.toml",
	desc = "Register crates.nvim keymaps for Cargo.toml buffers.",
	callback = function()
		local crates = require("crates")
		local opts = function(desc) return { buffer = true, desc = desc } end
		map("n", "<leader>Ct", crates.toggle, opts("Toggle crates"))
		map("n", "<leader>Cr", crates.reload, opts("Reload crates"))
		map("n", "<leader>Cv", crates.show_versions_popup, opts("Show versions"))
		map("n", "<leader>Cf", crates.show_features_popup, opts("Show features"))
		map("n", "<leader>Cu", crates.upgrade_crate, opts("Upgrade crate"))
		map("n", "<leader>CU", crates.upgrade_all_crates, opts("Upgrade all crates"))
	end,
})
