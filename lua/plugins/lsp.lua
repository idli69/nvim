local lspServers = {
	"gopls",
	"emmylua_ls",
	"html",
	"cssls",
	"tailwindcss",
	"emmet_language_server",
	"vtsls",
	"svelte",
}
local lspTools = {
	"tree-sitter-cli",
	"prettierd",
	"prettier",
	"stylua",
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
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },

				svelte = { "svelte", "prettierd", "prettier", stop_after_first = true },

				go = { "gofumpt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
