vim.cmd[[ colorscheme habamax ]]
vim.cmd[[ hi Normal guibg=NONE ]]
vim.cmd[[ hi StatusLine guibg=NONE ]]

require("options")
require("keymaps")
require("commands")
require("pack")

vim.lsp.enable("emmylua_ls")
