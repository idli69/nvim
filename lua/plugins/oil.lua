return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true,
    keymaps = {
      ["<esc><esc>"] = { "actions.close", mode = "n" },
    },
    use_default_keymaps = true,
    view_options = {
      show_hidden = true,
    },
  },
}
