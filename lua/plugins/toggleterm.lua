return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = {
		"ToggleTerm",
		"TermExec",
		"TermNew",
		"TermSelect",
	},

	keys = {
		{ "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
	},

	opts = {
		start_in_insert = true,
		persist_mode = true,
		close_on_exit = true,
		direction = "float",

		float_opts = {
			border = "rounded",
		},
	},
}
