local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map({ "i", "v", "x" }, "jk", "<ESC>")

-- Split window keymaps
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontal" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equals" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

map("n", "<leader>w", ":write<CR>", { desc = "Write" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
-- map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format" })

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Oil
map("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil" })

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

map("n", "<leader>lf", "<cmd>Format<CR>")

-- Todocomments
map("n", "<leader>tq", "<cmd>TodoQuickFix<CR>")
map("n", "<leader>tn", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "<leader>tp", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
