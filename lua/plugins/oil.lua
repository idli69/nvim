require("oil").setup({
  default_file_explorer = true,
  keymaps = {
    ["<Esc><Esc>"] = { "actions.close", mode = "n" },
  },
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
  }
})

vim.keymap.set("n","<leader>e",":Oil --float<cr>")
