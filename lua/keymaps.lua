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

-- Format
map("n", "<leader>lf", "<cmd>Format<CR>")

-- Todocomments
map("n", "<leader>tq", "<cmd>TodoQuickFix<CR>")
map("n", "<leader>tn", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "<leader>tp", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Telescope keymaps (lazy-loaded: telescope only loads when a keymap is triggered)
local function b(name)
	return function(...)
		return require("telescope.builtin")[name](...)
	end
end

local function SearchClasses()
	b("lsp_dynamic_workspace_symbols")({
		symbols = { "Class" },
		prompt_title = "Search Classes",
	})
end

local function SearchFunctions()
	b("lsp_dynamic_workspace_symbols")({
		symbols = { "Function", "Method" },
		prompt_title = "Search Functions",
	})
end

local function SearchVariables()
	b("lsp_dynamic_workspace_symbols")({
		symbols = { "Variable", "Constant" },
		prompt_title = "Search Variables",
	})
end

map("n", "<leader>fe", b("find_files"), { desc = "Telescope find files" })
map("n", "<leader>fk", b("keymaps"), { desc = "Telescope find keymaps" })
map("n", "<leader>fo", b("oldfiles"), { desc = "Telescope find old files" })
map("n", "<leader>ft", b("git_files"), { desc = "Telescope find git files" })
map("n", "<leader>ff", SearchFunctions, { desc = "Telescope find functions" })
map("n", "<leader>fc", SearchClasses, { desc = "Telescope find classes" })
map("n", "<leader>fv", SearchVariables, { desc = "Telescope find variables" })
map("n", "<leader>fg", b("live_grep"), { desc = "Telescope find grep" })
map("n", "<leader>fb", b("buffers"), { desc = "Telescope find buffers" })
map("n", "<leader>fh", b("help_tags"), { desc = "Telescope find help tags" })
map("n", "<leader>fs", b("lsp_dynamic_workspace_symbols"), { desc = "Telescope find symbols" })
map("n", "<leader>fu", b("grep_string"), { desc = "Telescope find word" })
map("n", "<leader>fd", b("diagnostics"), { desc = "Telescope find diagnostic" })
map("n", "<leader>fq", b("quickfix"), { desc = "Telescope find quickfix" })
map("n", "<leader>fr", b("resume"), { desc = "Telescope resume find" })
map("n", "<leader>fw", b("current_buffer_fuzzy_find"), { desc = "Telescope buffer fuzzy find" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
	{ desc = "LSP Definitions / References / ... (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Location list (Trouble)" })

-- LSP
map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Goto definition" })
map("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "Goto declaration" })
map("n", "gt", function()
	vim.lsp.buf.type_definition()
end, { desc = "Goto type definition" })

-- Copilot Chat
map("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
map("n", "<leader>cs", "<cmd>CopilotChatStop<CR>", { desc = "Stop Copilot chat current output" })
map("n", "<leader>cr", "<cmd>CopilotChatReset<CR>", { desc = "Reset Copilot chat window" })
map("n", "<leader>cm", "<cmd>CopilotChatModels<CR>", { desc = "List Copilot chat models" })

vim.keymap.set("n", "<leader>ce", function()
	local line = vim.api.nvim_get_current_line()
	vim.cmd("CopilotChatExplain " .. line)
end, { desc = "Explain current line with CopilotChat" })

-- Github Copilot
map("n", "<leader>c<Tab>", "<cmd>Copilot panel<CR>", { desc = "Open Copilot panel" })
map("i", "<C-Right>", "<Plug>(copilot-accept-word)", { desc = "Accept Copilot suggestion word" })

-- Prevent conflicts between copilot and copilotchat
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

