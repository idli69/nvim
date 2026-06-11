vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.scrolloff = 999
vim.opt.pumheight = 10
vim.opt.showmode = false

-- Tabs / Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Completion
vim.opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Better file searching
vim.opt.path:append("**")

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Misc
vim.opt.mouse = "a"
vim.opt.confirm = true
vim.opt.virtualedit = "block"
vim.opt.laststatus = 3

vim.opt.winborder = "single"
vim.opt.pumborder = "single"

vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
}

vim.opt.fillchars:append({
  eob = " ",
  foldopen = "",
  foldclose = "",
})
