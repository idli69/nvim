local g = vim.g

-- Leader
g.mapleader = " "
g.maplocalleader = " "

local map = vim.keymap.set

-- General
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Disable space mapping" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Better Movement
map("n", "J", "<Nop>", { desc = "Disable join lines" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all without saving" })

-- Clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

-- Move Lines
map("v", "A-J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "A-K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Indent
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Inlay Hints
map("n", "<leader>uh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), {
		bufnr = 0,
	})
end, {
	desc = "Toggle inlay hints",
})

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

		bmap("n", "gd", vim.lsp.buf.definition, "Goto definition")
		bmap("n", "gr", vim.lsp.buf.references, "List references")
		bmap("n", "K", vim.lsp.buf.hover, "Show hover documentation")
		bmap("n", "J", vim.diagnostic.open_float, "Show diagnostics")
		bmap("n", "ga", vim.lsp.buf.code_action, "Code action")
		bmap("n", "gn", vim.lsp.buf.rename, "Rename symbol")

		if client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, {
				bufnr = buf,
			}, {
				style = "virtual",
			})
		end
	end,
})
