vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

local f = require("xan.utils.functions")
local r = require("xan.utils.remaps")

-- remove highlighting
r.noremap("n", "<esc><esc>", ":nohlsearch<cr>", "which_key_ignore", { silent = true })

-- buffers
r.noremap("n", "<c-n>", ":bn<cr>", "next buffer")
r.noremap("n", "<c-p>", ":bp<cr>", "prev buffer")
r.noremap("n", "<c-x>", ":bd<cr>", "exit buffer")

-- tabs
r.noremap("n", "<leader><tab>l", "<cmd>tablast<cr>", "last tab")
r.noremap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", "first tab")
r.noremap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", "new tab")
r.noremap("n", "<leader><tab>]", "<cmd>tabnext<cr>", "next tab")
r.noremap("n", "<leader><tab>d", "<cmd>tabclose<cr>", "close tab")
r.noremap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", "previous tab")
r.map_virtual({ "<leader><tab>", group = "tabs", icon = { icon = " ", hl = "Constant" } })

-- remove trailing white space
f.cmd("Nows", "%s/\\s\\+$//e", { desc = "remove trailing whitespace" })

-- toggle wrapping
f.cmd("Wt", "setlocal wrap! nowrap?", { desc = "toggle line wrapping" })
r.noremap("n", "<leader>w", ":Wt<cr>", "toggle line wrapping")
r.map_virtual({ "<leader>w", group = "line wrap", icon = { icon = "󰖶", hl = "Constant" } })

r.noremap("n", "<leader>C", function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, "show highlight under cursor")
r.map_virtual({ "<leader>C", group = "highlight", icon = { icon = "󰨺", hl = "Constant" } })

-- fix syntax highlighting
f.cmd("FixSyntax", "syntax sync fromstart", { desc = "reload syntax highlighting" })

-- vertical term
f.cmd("T", ":vs | :set nu! | :term", { desc = "vertical terminal" })

-- the worst place in the universe
r.noremap("n", "Q", "<nop>", "")

-- move blocks
r.noremap("v", "J", ":m '>+1<CR>gv=gv", "move block up")
r.noremap("v", "K", ":m '<-2<CR>gv=gv", "move block down")

-- focus scrolling
r.noremap("n", "<C-d>", "<C-d>zz", "scroll down")
r.noremap("n", "<C-u>", "<C-u>zz", "scroll up")

-- focus highlight searches
r.noremap("n", "n", "nzzzv", "next match")
r.noremap("n", "N", "Nzzzv", "prev match")
