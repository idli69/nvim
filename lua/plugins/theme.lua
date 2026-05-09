return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        term_colors = true,
        float = {
          transparent = true,
          solid = true,
        },
        default_integrations = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
}
