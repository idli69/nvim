local Snacks = require("snacks")

Snacks.setup({
  picker = {enabled = true,},
  input = { enabled = true},
  statuscolumn = {enabled = true},
  quickfile = {enabled = true, },
  bigfile = {enabled = true,},
})

local map = vim.keymap.set

-- Picker
map("n", "<leader>ff", function()
  Snacks.picker.smart()
end, { desc = "Find Files" })

map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Live Grep" })

map("n", "<leader>fo", function()
  Snacks.picker.recent()
end, { desc = "Recent Files" })

-- Git
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "LazyGit" })
