return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
		"rafamadriz/friendly-snippets",
		"echasnovski/mini.icons",
		{ "saghen/blink.pairs", opts = {} },
	},

	build = function()
		require("blink.cmp").build():pwait()
	end,

	opts = {
		keymap = { preset = "super-tab" },

		completion = {
			documentation = {
				window = {
					scrollbar = false,
				},
			},
			ghost_text = {
				enabled = true,
				show_with_menu = false,
			},
			menu = {
				auto_show = false,
				scrollbar = false,
			},
		},
		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},

		fuzzy = {
			implementation = "prefer_rust",
		},
	},
}
