return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.basics").setup()
		require("mini.pairs").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup()

		local miniclue = require("mini.clue")

		miniclue.setup({
			triggers = {
				-- Leader key
				{ mode = { "n", "x" }, keys = "<Leader>" },
				{ mode = { "n", "x" }, keys = "g" },
			},
			window = { delay = 100 },
		})
	end,
}
