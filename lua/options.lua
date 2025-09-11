-- Global settings

local o = vim.o
local g = vim.g

g.maplocalleader = " "
g.mapleader = " "

g.have_nerd_font = true

-- Global settings
o.compatible = false
o.hidden = true
o.autoread = true
o.visualbell = false
o.ttyfast = true
o.number = true
o.relativenumber = true
o.history = 1000
o.mouse = 'a'
o.termguicolors = true
o.undofile = true
o.swapfile = false

-- Suffixes : these are the files we are unlikely to edit
o.suffixes = '.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.out,.toc,.gcda,.gcno'

-- tags file location
o.tags = '.git/tags,.hg/tags,./tags;'

o.background = 'dark'
o.syntax = 'enable'

o.ruler = true
o.textwidth = 0
o.backspace = 'indent,eol,start'
o.showmatch = true
o.showmode = true
o.showcmd = true
o.signcolumn = 'yes'
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
o.smartcase = true
o.infercase = true
o.hlsearch = true
o.showfulltag = true

-- Nice statusbar
o.laststatus = 2
o.statusline = table.concat({
	"%#@variable#",             -- highlight group
	"%-3.3n",                   -- buffer number
	"%f",                       -- file name
	"%h%m%r%w",                 -- flags
	"[%{strlen(&ft)?&ft:'none'},", -- filetype
	"%{&encoding},",            -- encoding
	"%{&fileformat}]",          -- file format
	--"%{FugitiveStatusline()}",              -- fugitive status
	"%=",                       -- right align
	"0x%-8B",                   -- current char
	"%-14.(%l,%c%V%) %<%P"      -- offset
}, " ")

-- Scrolling
o.scrolloff = 3
o.sidescrolloff = 2

-- Copy in both unnamed (*) and selection (+) clipboards
o.clipboard = 'unnamed,unnamedplus'

-- Highlight 80th column
o.colorcolumn = '80'

-- Show hidden characters
o.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
