local augroup = vim.api.nvim_create_augroup

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
	desc = "Highlight yanked text",
})

-- Restore Cursor Position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("LastPosition", { clear = true }),
	callback = function(event)
		local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(event.buf)

		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	desc = "Restore last cursor position",
})

-- Remove Trailing Whitespace Before Save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("TrimWhitespace", { clear = true }),
	callback = function()
		local pos = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", pos)
	end,
	desc = "Trim trailing whitespace",
})

-- Check if File Changed Outside Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "BufEnter" }, {
	group = augroup("CheckTime", { clear = true }),
	command = "checktime",
	desc = "Reload changed files",
})

-- Close Some Windows with q
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("CloseWithQ", { clear = true }),
	pattern = {
		"help",
		"lspinfo",
		"checkhealth",
		"qf",
		"man",
		"notify",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
		})
	end,
	desc = "Close special buffers with q",
})

-- Resize Splits Automatically
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup("ResizeSplits", { clear = true }),
	command = "tabdo wincmd =",
	desc = "Equalize split sizes",
})
