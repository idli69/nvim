return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.basics").setup()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
			require("mini.indentscope").setup()
			require("mini.clue").setup()
		end,
	},
}
