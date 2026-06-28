require("vim._core.ui2").enable()

local o = vim.opt

-- UI
o.number = true
o.relativenumber = false

o.termguicolors = true
o.cursorline = true
o.cursorlineopt = "number"

o.signcolumn = "yes"
o.laststatus = 3
o.cmdheight = 1

o.winborder = "single"

o.showmode = false
o.pumheight = 10

o.scrolloff = 9999
o.sidescrolloff = 10

o.wrap = false
o.linebreak = true

o.splitbelow = true
o.splitright = true

o.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "",
	foldclose = "",
	foldsep = " ",
	diff = "╱",
}

-- Indentation
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
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

-- Undo Directory
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")
o.undodir = undodir

-- Completion
o.completeopt = {
	"menu",
	"menuone",
	"noselect",
	"popup",
	"fuzzy",
}

-- Timing
o.updatetime = 200
o.timeoutlen = 300

-- Folding (LSP/Treesitter friendly)
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Command Line
o.wildmode = "longest:full,full"
o.wildoptions = "pum"

-- Better Editing
o.backspace = {
	"indent",
	"eol",
	"start",
}

o.whichwrap:append("<>[]hl")

-- Invisible Characters
o.list = true
o.listchars = {
	tab = "  ",
	trail = "·",
	nbsp = "␣",
}

-- Diagnostics Space
o.numberwidth = 2
o.signcolumn = "yes:1"

-- Session Friendly
o.hidden = true

-- Faster Redraw
o.lazyredraw = true
