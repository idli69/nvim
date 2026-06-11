vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/stevearc/oil.nvim",

	-- Mini
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.cmdline",

	"https://github.com/nvim-lualine/lualine.nvim",

	"https://github.com/nvim-mini/mini.pick",

	-- Snacks
	"https://github.com/folke/snacks.nvim",

	"https://github.com/stevearc/conform.nvim",
})

-- Theme
require("vague").setup({
	transparent = true,
})

vim.cmd.colorscheme("vague")

-- Oil
require("oil").setup({
	default_file_explorer = true,
	keymaps = {
		["<esc><esc>"] = { "actions.close", mode = "n" },
	},
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>e", function()
	vim.cmd("silent Oil --float")
end)

-- Mini
local icons = require("mini.icons")

icons.setup()
icons.mock_nvim_web_devicons()

require("mini.pairs").setup()
require("mini.ai").setup()
require("mini.surround").setup()

require("mini.cmdline").setup({
	autocorrect = {
		enable = false,
	},
})

local MiniPick = require("mini.pick")
MiniPick.setup()
vim.ui.select = require("mini.pick").ui_select

-- Snacks
require("snacks").setup({
	picker = { enabled = true },
	quickfile = { enabled = true },
	bigfile = { enabled = true },
})

-- Keymaps
local map = vim.keymap.set

-- Picker
map("n", "<leader><leader>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })

map("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

map("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })

map("n", "<leader>f.", function()
	Snacks.picker.resume()
end, { desc = "Resume" })

-- Find
map("n", "<leader>fn", function()
	Snacks.picker.files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find Config File" })

map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })

map("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })

map("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

-- Diagnostics
map("n", "<leader>dd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>fd", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

-- Help
map("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })

map("n", "<leader>fi", function()
	Snacks.picker.icons()
end, { desc = "Icons" })

map("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })

map("n", "<leader>fm", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })

-- Grep
map("n", "<leader>gb", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })

map("n", "<leader>gg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

map({ "n", "x" }, "<leader>gw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual Selection or Word" })
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diagnostics", "lsp_status" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "branch", "diff" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
