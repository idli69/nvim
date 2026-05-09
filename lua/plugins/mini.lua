return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    opts = {},
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    opts = {},
  },
  { "windwp/nvim-ts-autotag", version = false, opts = {} },
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "VeryLazy",
    version = "*",
    keys = {
      {
        "<leader>v",
        function() require("oklch-color-picker").pick_under_cursor() end,
        desc = "Color pick under cursor",
      },
    },
    ---@type oklch.Opts
    opts = {},
  }
}
