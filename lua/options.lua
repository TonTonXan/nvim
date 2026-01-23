local o = vim.o
local g = vim.g

-- Leader key
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
o.smartcase = true
o.infercase = true
o.hlsearch = true
o.showfulltag = true

-- Scrolling
o.scrolloff = 3
o.sidescrolloff = 2

-- Highlight 80th column
o.colorcolumn = "80"

-- vim.opt.listchars = {eol='¬',tab='>·',trail='~',extends='>',precedes='<',space='·' }
-- o.list = true
