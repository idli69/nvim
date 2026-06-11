return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    "nvim-mini/mini.icons",
  },
  keys = {
    { "<leader>e", "<cmd>Oil --float<CR>", desc = "Open File Explorer" },
  },
  config = function()
    require("mini.icons").setup()

    require("oil").setup({
      default_file_explorer = true,
      watch_for_changes = false,
      keymaps = {
        ["<esc><esc>"] = { "actions.close", mode = "n" },
      },
      view_options = {
        show_hidden = true,
        natural_order = "fast",
      },
      float = {
        padding = 2,
        max_width = 0.8,
        max_height = 0.8,
        border = "single",
        win_options = {
          winblend = 0,
        },
      },
    })
  end,
}
