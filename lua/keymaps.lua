local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map({ 'i', 'v', 'x' }, 'jk', '<ESC>')

-- Split window keymaps
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

map('n', '<leader>sv', '<C-w>v', { desc = "Split window vertical" })
map('n', '<leader>sh', '<C-w>s', { desc = "Split window horizontal" })
map('n', '<leader>se', '<C-w>=', { desc = "Make splits equals" })
map('n', '<leader>sx', '<cmd>close<CR>', { desc = "Close split" })

map('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Update and source" })
map('n', '<leader>w', ':write<CR>', { desc = "Write" })
map('n', '<leader>q', ':quit<CR>', { desc = "Quit" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format" })

map('n', 'grd', vim.lsp.buf.declaration, { desc = "Go to declaration" })
map('n', 'grD', vim.lsp.buf.definition, { desc = "Go to definition" })

map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

-- Switch between source/header
vim.api.nvim_create_user_command('A', 'ClangdSwitchSourceHeader', {})

-- Oil keymaps
map('n', '<leader>e', ":Oil<CR>", { desc = "Open Oil" })

-- Lazygit keymaps
map('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = "Open LazyGit" })

-- Telescope keymaps
local builtin = require("telescope.builtin")

function SearchClasses()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Class" },
		prompt_title = "Search Classes",
	})
end

function SearchFunctions()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Function", "Method" },
		prompt_title = "Search Functions",
	})
end

function SearchVariables()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Variable", "Constant" },
		prompt_title = "Search Variables",
	})
end

map('n', '<leader>fe', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keymaps' })
map('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope find old files' })
map('n', '<leader>ft', builtin.git_files, { desc = 'Telescope find git files' })
map('n', '<leader>ff', SearchFunctions, { desc = 'Telescope find functions' })
map('n', '<leader>fc', SearchClasses, { desc = 'Telescope find classes' })
map('n', '<leader>fv', SearchVariables, { desc = 'Telescope find variables' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope find grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find help tags' })
map('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope find symbols' })
map('n', '<leader>fu', builtin.grep_string, { desc = 'Telescope find word' })
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope find diagnostic' })
map('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope find quickfix' })
map('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume find' })
map('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = 'Telescope buffer fuzzy find' })

-- Markview keymaps
map('n', '<leader>mt', ':Markview toggle<CR>', { desc = 'Toggle markview' })

-- Trouble
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>', { desc = "Diagnostics (Trouble)" })
map('n', '<leader>xs', '<cmd>Trouble symbols toggle focus=true<cr>', { desc = "Symbols (Trouble)" })
map('n', '<leader>xl', '<cmd>Trouble lsp toggle focus=true win.position=right<cr>', { desc = "LSP Definitions / references / ... (Trouble)" })
map('n', '<leader>xk', '<cmd>Trouble loclist toggle<cr>', { desc = "Location List (Trouble)" })
map('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', { desc = "Quickfix list (Trouble)" })

-- Github Copilot
map('n', '<leader>c<Tab>', '<cmd>Copilot panel<CR>', { desc = "Open Copilot panel" })
map('i', '<C-Right>', '<Plug>(copilot-accept-word)', { desc = "Accept Copilot suggestion word" })

-- Prevent conflicts between copilot and copilotchat
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

-- Copilot Chat
map('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = "Toggle Copilot Chat" })
map('n', '<leader>cs', '<cmd>CopilotChatStop<CR>', { desc = "Stop Copilot chat current output" })
map('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { desc = "Reset Copilot chat window" })

vim.keymap.set('n', '<leader>ce', function()
  local line = vim.api.nvim_get_current_line()
  vim.cmd('CopilotChatExplain ' .. line)
end, { desc = 'Explain current line with CopilotChat' })

-- Gitsigns
map('n', '<leader>gsh', ':Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
map('n', '<leader>gsr', ':Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
map('n', '<leader>gsbb', ':Gitsigns blame<CR>', { desc = "Blame buffer" })
map('n', '<leader>gsbl', ':Gitsigns blame_line<CR>', { desc = "Blame line" })
map('n', '<leader>gsbt', ':Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle current line blame" })
map('n', '<leader>gsw', ':Gitsigns toggle_word_diff<CR>', { desc = "Toggle word diff" })
