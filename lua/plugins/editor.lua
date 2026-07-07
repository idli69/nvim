return {
	{
		"folke/snacks.nvim",
		event = "VeryLazy",

		opts = {
			picker = {
				enabled = true,
				ui_select = true,
				layout = {
					preset = "sidebar",
				},
			},
			input = { enabled = true },
			statuscolumn = { enabled = true },
			quickfile = { enabled = true },
			bigfile = { enabled = true },
		},

		keys = {
			{
				"<leader>ff",
				function()
					require("snacks").picker.smart()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Files",
			},
			{
				"<leader>fo",
				function()
					require("snacks").picker.recent()
				end,
				desc = "Recent Files",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-mini/mini.icons", version = false, opts = {} },
		keys = {
			{
				"<leader>e",
				"<cmd>Oil --float<cr>",
				desc = "Open Oil explorer",
			},
		},

		opts = {
			keymaps = {
				["<Esc><Esc>"] = { "actions.close", mode = "n" },
			},
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
			},
		},
	},
}
