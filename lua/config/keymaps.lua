local g = vim.g

-- Leader
g.mapleader = " "
g.maplocalleader = " "

-- Disable Some Builtins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

local map = vim.keymap.set
-- General
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- Better Movement
map("n", "J", "<Nop>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<leader>w", "<cmd>write<CR>")
map("n", "<leader>q", "<cmd>quit<CR>")
map("n", "<leader>Q", "<cmd>qa!<CR>")

-- Clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>p", [["+p]])
map("n", "<leader>p", [["+p]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- Move Lines
map("v", "A-J", ":m '>+1<CR>gv=gv")
map("v", "A-K", ":m '<-2<CR>gv=gv")

-- Indent
map("v", "<", "<gv")
map("v", ">", ">gv")
