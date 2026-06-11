require("vim._core.ui2").enable({})

vim.g.mapleader = " "
vim.g.netrw_banner = 0

vim.opt.termguicolors = true
vim.opt.winborder = "single"
vim.opt.pumborder = "single"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
vim.opt.fillchars:append({ eob = " " })

vim.opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" }
vim.opt.shortmess:append("c")

-- vim.opt.guicursor = ""
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 1

local yank_group = vim.api.nvim_create_augroup("YankHighlight", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	desc = "Highlight when yanking text",
	callback = function()
		vim.hl.on_yank()
	end,
})
