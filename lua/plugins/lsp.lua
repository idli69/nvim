local lspServers = {
	"vtsls",
	"gopls",
	"svelte",
	"tailwindcss",
	"lua_ls",
	"html",
	"cssls",
}
local lspTools = {
	"tree-sitter-cli",
	"stylua",
	"prettier",
	"prettierd",
	"gofumpt",
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason-lspconfig.nvim",
				dependencies = {
					{ "mason-org/mason.nvim", opts = {} },
				},
				opts = {
					ensure_installed = lspServers,
				},
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				opts = {
					ensure_installed = lspTools,
				},
			},
		},
		config = function()
			vim.lsp.config("tailwindcss", {
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ [=[class:\s*["\`']([^"\`']*)["\`']]=], [=[["\`']([^"\`']*)["\`']]=] },
								{ [=[class:(\w+)]=], [=[(\w+)]=] },
							},
						},
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofumpt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
