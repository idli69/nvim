require("vim._core.ui2").enable()

local o = vim.opt

-- Editor
o.number = true
o.cursorline = true
o.cursorlineopt = "number"
o.termguicolors = true
o.laststatus = 3
o.cmdheight = 1
o.winborder = "single"
o.showmode = false
o.pumheight = 10
o.scrolloff = 8
o.sidescrolloff = 10
o.wrap = false
o.linebreak = true
o.splitbelow = true
o.splitright = true
o.hidden = true

-- Indentation
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.breakindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Mouse
o.mouse = "a"

-- Files
o.autoread = true
o.confirm = true
o.swapfile = false
o.backup = false
o.writebackup = false
o.undofile = true

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")
o.undodir = undodir

-- Completion
o.completeopt = { "menu", "menuone", "noselect", "popup", "fuzzy" }

-- Timing
o.updatetime = 200
o.timeoutlen = 300

-- Folding
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Command line
o.wildmode = "longest:full,full"
o.wildoptions = "pum"

-- Editing
o.backspace = { "indent", "eol", "start" }
o.whichwrap:append("<>[]hl")

-- Visual
o.list = true
o.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
o.numberwidth = 2
o.signcolumn = "yes:1"

-- Fillchars
o.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "",
	foldclose = "",
	foldsep = " ",
	diff = "╱",
}

-- Diagnostics
vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { border = "single", source = "if_many" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
		},
	},
})
