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

map('n', '<leader>w', ':write<CR>', { desc = "Write" })
map('n', '<leader>q', ':quit<CR>', { desc = "Quit" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format" })

-- Lazygit
map('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = "Open LazyGit" })

-- Oil
map('n', '<leader>e', ":Oil<CR>", { desc = "Open Oil" })
