return {
  "folke/snacks.nvim",
  lazy = false,

  opts = {
    picker = { enabled = true },
    input = { enabled = true },
    statuscolumn = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
  },

  keys = {
    {
      "<leader>ff",
      function() require("snacks").picker.smart() end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function() require("snacks").picker.grep() end,
      desc = "Live Grep",
    },
    {
      "<leader>fh",
      function() require("snacks").picker.help() end,
      desc = "Help Files",
    },
    {
      "<leader>fo",
      function() require("snacks").picker.recent() end,
      desc = "Recent Files",
    },
    {
      "<leader>gg",
      function() require("snacks").lazygit() end,
      desc = "LazyGit",
    },
  },
}
