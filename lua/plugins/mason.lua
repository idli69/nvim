local lspServers = {
	"emmylua_ls",
	"html",
	"cssls",
	"emmet_language_server",
	"tailwindcss",
	"svelte",
	"gopls",
}
local lspTools = {
	"stylua",
	"prettier",
	"prettierd",
	"gofumpt",
}

return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = lspServers,
			ensure_installed = lspServers,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = lspTools,
		},
	},
	{
		"stevearc/conform.nvim",
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
