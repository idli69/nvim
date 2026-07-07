return {
	"MeanderingProgrammer/treesitter-modules.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		ensure_installed = {
			"html", "css", "javascript", 
			"svelte", "go", "json", "lua", "bash", "markdown",
		},
		auto_install = true,
		fold = { enable = true },
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<cr>",
				node_incremental = "<cr>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		indent = { enable = true },
	},
}
