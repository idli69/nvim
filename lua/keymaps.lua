local map = vim.keymap.set

vim.g.mapleader = " "

-- General
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Clipboard & Registers
map("x", "p", [["_dP]], { desc = "Paste without losing yank" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })

-- Moving Lines
map({ "n", "v" }, "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
map({ "n", "v" }, "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Indentation
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Navigation
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up centered" })
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Search & Replace
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "Replace word under cursor",
})

-- Utilities
map("n", "<leader>x", function()
	vim.cmd("write")
	vim.cmd("silent !chmod +x %")
	print("Made executable")
end, { desc = "Save and chmod +x current file" })

map("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, {
	desc = "Open undo tree",
})
