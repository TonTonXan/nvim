local opt = vim.opt
local g = vim.g

-- Leader key must be set before any plugin loads to ensure keymaps bind correctly.
g.maplocalleader = " "
g.mapleader = " "

g.have_nerd_font = true
-- Disables Copilot's default Tab binding; <S-Tab> is used instead to avoid conflict with blink.cmp.
g.copilot_no_tab_map = true

opt.autoread = true
opt.visualbell = false
opt.number = true
opt.relativenumber = true
opt.history = 1000
opt.mouse = "a"
opt.termguicolors = true
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 300

opt.textwidth = 0 -- Disables automatic hard line-wrapping; formatting is handled by formatters.
opt.showmatch = true
opt.showmode = false -- lualine shows the mode
opt.showcmd = true
opt.signcolumn = "yes"
opt.startofline = false -- Preserves cursor column on jumps (G, gg, Ctrl-D, etc.).

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- Cursor and scrolling
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Line wrapping
opt.wrap = false

-- Default indentation and coding style
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.autoindent = true
opt.smartindent = true

-- Search settings
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.hlsearch = true

opt.colorcolumn = "80"

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Sync all yank/paste operations with the Windows clipboard.
opt.clipboard = "unnamedplus"

-- WSL2 does not share the clipboard with Windows by default.
-- Prefer win32yank.exe (fast, purpose-built); fall back to clip.exe + PowerShell if not installed.
-- See TODO.md for win32yank installation instructions.
if vim.fn.executable("win32yank.exe") == 1 then
	vim.g.clipboard = {
		name = "win32yank",
		copy  = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
		paste = { ["+"] = "win32yank.exe -o --lf",   ["*"] = "win32yank.exe -o --lf" },
		cache_enabled = 0,
	}
else
	-- Paste via PowerShell has ~300-500ms startup delay; install win32yank to eliminate it.
	vim.g.clipboard = {
		name = "WslClipboard",
		copy  = {
			["+"] = "/mnt/c/Windows/System32/clip.exe",
			["*"] = "/mnt/c/Windows/System32/clip.exe",
		},
		paste = {
			["+"] = '/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = '/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
