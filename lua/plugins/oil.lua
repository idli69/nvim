return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-mini/mini.icons", version = false, opts ={} },
  lazy = false,
  keys = {
    {
      "<leader>e",
      "<cmd>Oil --float<cr>",
      desc = "Open Oil explorer",
    },
  },

  opts = {
    default_file_explorer = true,
    keymaps = {
      ["<Esc><Esc>"] = { "actions.close", mode = "n" },
    },
    use_default_keymaps = true,
    view_options = {
      show_hidden = true,
    },
  },
}
