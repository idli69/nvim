return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"nvim-mini/mini.icons",
		{ "nvim-mini/mini.pairs", opts = {} },
	},
	opts = {
		keymap = { preset = "super-tab" },
		completion = {
			documentation = { auto_show = false },
			ghost_text = { enabled = true },
			menu = { auto_show = false },
		},
		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},
		fuzzy = { implementation = "lua" },
	},
}
