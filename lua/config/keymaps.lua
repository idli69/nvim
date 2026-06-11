local map = vim.keymap.set

-- Better movement
map({ "n", "v" }, "j", "gj")
map({ "n", "v" }, "k", "gk")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Better paste
map("x", "<leader>p", [["_dP]])

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move selected text
map("v", "M-j", ":m '>+1<CR>gv=gv")
map("v", "M-k", ":m '<-2<CR>gv=gv")

-- Save
map("n", "<leader>w", "<cmd>write<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")

-- Clear search
map("n", "<Esc>", "<cmd>noh<cr><Esc>")

-- Oil
map("n", "<leader>e", "<CMD>Oil --float<CR>", {
  desc = "Open parent directory",
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "grn", vim.lsp.buf.rename, opts)
    map("n", "gra", vim.lsp.buf.code_action, opts)

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "J", vim.diagnostic.open_float, opts)
  end,
})
