local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Windows
-- Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Editing
-- Keep selection after indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move selected lines
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- Movement
-- Keep cursor centered while jumping
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Insert-mode arrow movement
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Search
map("n", "<Esc>", "<cmd>noh<cr>", {
  desc = "Clear search highlight",
})

-- Clipboard
-- System clipboard only. Normal y/p stay internal to Neovim.
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste before from clipboard" })

-- Disable Annoyances
map("n", "Q", "<nop>", opts)
