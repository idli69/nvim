local g = vim.g
local map = vim.keymap.set

-- Leaders
g.mapleader = " "
g.maplocalleader = " "

-- General
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Disable Space" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Movement
map("n", "J", "<Nop>", { desc = "Disable join lines" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Visual Mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- LSP
local lsp_group = vim.api.nvim_create_augroup("UserLsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,
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

		-- Navigation
		bmap("n", "gd", vim.lsp.buf.definition, "Goto definition")
		bmap("n", "gr", vim.lsp.buf.references, "Goto references")
		bmap("n", "K", vim.lsp.buf.hover, "Hover")
		bmap("n", "J", vim.diagnostic.open_float, "Line diagnostics")

		-- Actions
		bmap("n", "ga", vim.lsp.buf.code_action, "Code action")
		bmap("n", "gn", vim.lsp.buf.rename, "Rename")

		-- Inlay hints
		bmap("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
		end, "Toggle inlay hints")

		-- Document colors
		if client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, {
				bufnr = buf,
			}, {
				style = "virtual",
			})
		end
	end,
})
