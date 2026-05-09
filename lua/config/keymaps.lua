local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- WINDOW NAVIGATION
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- WINDOW RESIZE
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- BETTER INDENTING
map("v", "<", "<gv")
map("v", ">", ">gv")

-- MOVE LINES
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- KEEP CURSOR CENTERED
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- CLEAR SEARCH
map("n", "<Esc>", "<cmd>noh<cr>", {
  desc = "Clear search highlight",
})

-- DISABLE ACCIDENTAL EX MODE
map("n", "Q", "<nop>")

-- FAST SCROLL IN INSERT
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
