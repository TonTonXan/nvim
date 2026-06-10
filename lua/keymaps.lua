local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map({ "i", "v", "x" }, "jk", "<ESC>", { desc = "Escape" })

-- Split window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper window" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontal" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- File
map("n", "<leader>w", ":write<CR>", { desc = "Write" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

map("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil" })

-- Format (supports range via :Format or visual selection)
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

map("n", "<leader>lf", "<cmd>Format<CR>", { desc = "Format buffer" })

-- Todocomments
map("n", "<leader>tq", "<cmd>TodoQuickFix<CR>", { desc = "Todo quickfix" })
map("n", "<leader>tn", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "<leader>tp", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Telescope (lazy-loaded: module only required when the keymap fires)
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

map("n", "<leader>fe", b("find_files"), { desc = "Find files" })
map("n", "<leader>fk", b("keymaps"), { desc = "Find keymaps" })
map("n", "<leader>fo", b("oldfiles"), { desc = "Find old files" })
map("n", "<leader>ft", b("git_files"), { desc = "Find git files" })
map("n", "<leader>ff", SearchFunctions, { desc = "Find functions" })
map("n", "<leader>fc", SearchClasses, { desc = "Find classes" })
map("n", "<leader>fv", SearchVariables, { desc = "Find variables" })
map("n", "<leader>fg", b("live_grep"), { desc = "Live grep" })
map("n", "<leader>fb", b("buffers"), { desc = "Find buffers" })
map("n", "<leader>fh", b("help_tags"), { desc = "Find help tags" })
map("n", "<leader>fs", b("lsp_dynamic_workspace_symbols"), { desc = "Find symbols" })
map("n", "<leader>fu", b("grep_string"), { desc = "Find word under cursor" })
map("n", "<leader>fd", b("diagnostics"), { desc = "Find diagnostics" })
map("n", "<leader>fq", b("quickfix"), { desc = "Find quickfix" })
map("n", "<leader>fr", b("resume"), { desc = "Resume last find" })
map("n", "<leader>fw", b("current_buffer_fuzzy_find"), { desc = "Find in buffer" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP definitions/references (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list (Trouble)" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })

-- Diagnostics navigation
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Debug (nvim-dap)
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue / start" })
map("n", "<leader>dn", function() require("dap").step_over() end, { desc = "Step over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step into" })
map("n", "<leader>do", function() require("dap").step_out() end, { desc = "Step out" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run last" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open REPL" })
map("n", "<leader>dx", function() require("dap").terminate() end, { desc = "Terminate" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

-- Neotest
map("n", "<leader>nt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
map("n", "<leader>nf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run test file" })
map("n", "<leader>nl", function() require("neotest").run.run_last() end, { desc = "Run last test" })
map("n", "<leader>ns", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
map("n", "<leader>no", function() require("neotest").output.open({ enter = true }) end, { desc = "Show test output" })

-- CMake
map("n", "<leader>mb", "<cmd>CMakeBuild<CR>", { desc = "Build" })
map("n", "<leader>mr", "<cmd>CMakeRun<CR>", { desc = "Run" })
map("n", "<leader>mc", "<cmd>CMakeClean<CR>", { desc = "Clean" })
map("n", "<leader>mp", "<cmd>CMakeSelectBuildPreset<CR>", { desc = "Select build preset" })
map("n", "<leader>mt", "<cmd>CMakeSelectBuildTarget<CR>", { desc = "Select build target" })
map("n", "<leader>ms", "<cmd>CMakeSettings<CR>", { desc = "Settings" })

-- Python
map("n", "<leader>pv", "<cmd>VenvSelect<CR>", { desc = "Select virtualenv" })

-- Copilot Chat
map("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
map("n", "<leader>cs", "<cmd>CopilotChatStop<CR>", { desc = "Stop Copilot chat output" })
map("n", "<leader>cr", "<cmd>CopilotChatReset<CR>", { desc = "Reset Copilot chat" })
map("n", "<leader>cm", "<cmd>CopilotChatModels<CR>", { desc = "List Copilot chat models" })

map("n", "<leader>ce", function()
	local line = vim.api.nvim_get_current_line()
	vim.cmd("CopilotChatExplain " .. line)
end, { desc = "Explain current line with CopilotChat" })

-- Copilot inline suggestions (Tab is reserved for blink.cmp; S-Tab accepts Copilot instead).
map("n", "<leader>c<Tab>", "<cmd>Copilot panel<CR>", { desc = "Open Copilot panel" })
map("i", "<C-Right>", "<Plug>(copilot-accept-word)", { desc = "Accept Copilot word" })
map("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
