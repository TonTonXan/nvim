vim.cmd([[set mouse=]])
vim.o.winborder = "rounded"
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.signcolumn = "yes"

vim.o.wrap = false
vim.o.swapfile = false

vim.g.maplocalleader = " "
vim.g.mapleader = " "

vim.o.smartcase = true
vim.g.have_nerd_font = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitbelow = true
vim.o.splitright = true

-- Sync clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Set a character for tab, space and trailing whitespace
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.inccommand = "split"

vim.o.cursorline = true
vim.o.scrolloff = 10

vim.o.confirm = true

local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map({ 'i', 'v', 'x' }, 'jk', '<ESC>')

map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = vim.api.nvim_create_augroup("kickstart_highlight_yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.pack.add({
	{ src = "https://github.com/miikanissi/modus-themes.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})

-- auto complete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

require "mini.pick".setup()
require "oil".setup()
require "mason".setup()

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

vim.lsp.enable({ "lua_ls" })


map('n', '<leader>lg', '<cmd>LazyGit<CR>')

-- Color scheme
vim.cmd("colorscheme modus")
vim.cmd(":hi statusline guibg=NONE")
