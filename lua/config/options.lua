local opt = vim.opt
local g = vim.g

-- LEADER
g.mapleader = " "
g.maplocalleader = " "

g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_netrwPlugin = 1
g.loaded_netrw = 1

-- GENERAL
opt.mouse = "a"
-- opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

opt.updatetime = 200
opt.timeoutlen = 300
opt.ttimeoutlen = 10

opt.confirm = true
opt.autoread = true
opt.hidden = true

opt.termguicolors = true
opt.signcolumn = "yes:1"
opt.cursorline = true
opt.cursorlineopt = "number"

opt.winborder = "rounded"

opt.completeopt = { "menu", "menuone", "noselect" }
opt.backspace = { "start", "eol", "indent" }

opt.cmdheight = 1
opt.pumheight = 10

opt.showmode = false
opt.laststatus = 3

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.wrap = false
opt.linebreak = true

opt.number = true
opt.relativenumber = true

opt.ruler = false
opt.shortmess:append("c")
opt.virtualedit = "block"
opt.inccommand = "split"

-- SEARCH
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- INDENTATION
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true
opt.autoindent = true

-- FILES
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Faster file operations
opt.lazyredraw = true
opt.synmaxcol = 300

-- PERFORMANCE
opt.complete = ".,w,b,u,t"
opt.redrawtime = 1500

-- FOLDING (Treesitter)
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- WHITESPACE
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}
opt.fillchars:append({ eob = " " })
