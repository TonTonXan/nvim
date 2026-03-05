local o = vim.o
local g = vim.g

-- Leader key
g.maplocalleader = " "
g.mapleader = " "

g.have_nerd_font = true

-- Global settings
o.autoread = true
o.visualbell = false
o.number = true
o.relativenumber = true
o.history = 1000
o.mouse = "a"
o.termguicolors = true
o.undofile = true
o.swapfile = false

o.ruler = true
o.textwidth = 0
o.backspace = "indent,eol,start"
o.showmatch = true
o.showmode = true
o.showcmd = true
o.signcolumn = "yes"
o.startofline = false

-- Default indentation and coding style
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.autoindent = true
o.smartindent = true

-- Search setting
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.infercase = true
o.hlsearch = true
o.showfulltag = true

-- Scrolling
o.scrolloff = 3
o.sidescrolloff = 2

-- Highlight 80th column
o.colorcolumn = "80"

-- Show hidden characters
o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "/mnt/c/Windows/System32/clip.exe",
		["*"] = "/mnt/c/Windows/System32/clip.exe",
	},
	paste = {
		["+"] = '/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = '/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
