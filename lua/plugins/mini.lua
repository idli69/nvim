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
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        options = {
          parsers = { css_fn = true },
          display = {
            mode = "virtualtext",
            virtualtext = { position = "after" },
          },
        },
      })
    end,
  },
}
