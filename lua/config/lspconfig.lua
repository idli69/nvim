vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,

	float = {
		border = "rounded",
		source = "if_many",
	},

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
		},
	},
})

local group = vim.api.nvim_create_augroup("user-lsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,

	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		local buf = ev.buf

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = buf,
				silent = true,
				desc = desc,
			})
		end

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
		map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("n", "gt", vim.lsp.buf.type_definition, "Goto Type Definition")
		map("n", "gr", vim.lsp.buf.references, "References")

		-- Information
		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "J", vim.diagnostic.open_float, "Line Diagnostics")
		map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

		-- Actions
		map("n", "ga", vim.lsp.buf.code_action, "Code Action")
		map("n", "gn", vim.lsp.buf.rename, "Rename")

		-- Inlay Hints
		if client:supports_method("textDocument/inlayHint") then
			map("n", "gi", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
			end, "Toggle Inlay Hints")
		end

		-- Document Highlights
		if client:supports_method("textDocument/documentHighlight") then
			local highlight_group = vim.api.nvim_create_augroup("lsp-highlight-" .. buf, { clear = true })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = highlight_group,
				buffer = buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = highlight_group,
				buffer = buf,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = highlight_group,
				buffer = buf,
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})
		end

		-- Document Colors (0.12)
		if client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, {
				bufnr = buf,
			}, {
				style = "virtual",
			})
		end
	end,
})
