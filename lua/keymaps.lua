local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map({'i', 'v', 'x'}, 'jk', '<ESC>')

-- Split window keymaps
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

map('n', '<leader>sv', '<C-w>v')
map('n', '<leader>sh', '<C-w>s')
map('n', '<leader>se', '<C-w>=')
map('n', '<leader>sx', '<cmd>close<CR>')

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

-- Switch between source/header
vim.api.nvim_create_user_command('A', 'ClangdSwitchSourceHeader', {})

-- Oil keymaps
map('n', '<leader>e', ":Oil<CR>")

-- Lazygit keymaps
map('n', '<leader>lg', '<cmd>LazyGit<CR>')

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

map('n', '<leader>fe', builtin.find_files, { desc = 'Telescope find files'})
map('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keymaps'})
map('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope find old files'})
map('n', '<leader>ft', builtin.git_files, { desc = 'Telescope find git files'})
map('n', '<leader>ff', SearchFunctions, { desc = 'Telescope find functions'})
map('n', '<leader>fc', SearchClasses, { desc = 'Telescope find classes'})
map('n', '<leader>fv', SearchVariables, { desc = 'Telescope find variables'})
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope find grep'})
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffers'})
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find help tags'})
map('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope find symbols'})
map('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope find word'})
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope find diagnostic'})
map('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope find quickfix'})
map('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume find'})
