return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup()
		require("mini.notify").setup()
		require("mini.pairs").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup()
		require("mini.clue").setup({
			triggers = {
				{ mode = { "n", "x" }, keys = "<Leader>" },
				{ mode = { "n", "x" }, keys = "g" },
			},
			window = { delay = 100 },
		})
	end,
}
