return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",
	dependencies = {
		"nvim-mini/mini.icons",
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
