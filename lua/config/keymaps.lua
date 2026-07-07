local g = vim.g

-- Leader
g.mapleader = " "
g.maplocalleader = " "

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

-- Inlay Hints
map("n", "<leader>uh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Toggle Inlay Hints" })

-- LSP Keymaps
local augroup = vim.api.nvim_create_augroup("UserLsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup,

	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		local buf = ev.buf

		local bmap = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = buf,
				silent = true,
				desc = desc,
			})
		end

		bmap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
		bmap("n", "gr", vim.lsp.buf.references, "References")
		bmap("n", "K", vim.lsp.buf.hover, "Hover")
		bmap("n", "J", vim.diagnostic.open_float, "Diagnostics")
		bmap("n", "ga", vim.lsp.buf.code_action, "Code Action")
		bmap("n", "gn", vim.lsp.buf.rename, "Rename")

		if client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, {
				bufnr = buf,
			}, {
				style = "virtual",
			})
		end
	end,
})
