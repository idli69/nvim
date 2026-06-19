require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_enable = true,
})

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		lua = { "stylua" },
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"emmylua_ls",
		"stylua",

		"superhtml",
		"cssls",
		"tailwindcss",
		"vtsls",
		"emmet_language_server",
		"biome",
	},

	auto_update = true,
})
