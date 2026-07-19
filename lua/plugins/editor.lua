return {
	{
		"folke/snacks.nvim",
		event = "VeryLazy",
		opts = {
			picker = {
				enabled = true,
				ui_select = true,
				layout = { preset = "telescope" },
			},
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
		keys = {
			{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Open Oil explorer" },
		},
		opts = {
			keymaps = {
				["<Esc><Esc>"] = { "actions.close", mode = "n" },
			},
			use_default_keymaps = true,
			view_options = { show_hidden = true },
		},
	},
}
