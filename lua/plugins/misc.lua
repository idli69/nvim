return {
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },

				"lazy.nvim",
				"snacks.nvim",
				"LazyVim",
			},
		},
	},
}
