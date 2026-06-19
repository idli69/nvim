require('vim._core.ui2').enable()

require("config.options")
require("config.keymaps")

-- plugin install
vim.pack.add({
  -- Theme
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },

  -- Oil
  { src = "https://github.com/stevearc/oil.nvim", name = "oil" },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
  { src = "https://github.com/MeanderingProgrammer/treesitter-modules.nvim", name = "treesitter-modules" },

  -- Blink
  { src = "https://github.com/saghen/blink.lib", name = "blink-lib" },
  { src = "https://github.com/saghen/blink.cmp", name = "blink-cmp" },

  -- Snacks
  { src = "https://github.com/folke/snacks.nvim", name = "snacks" },

  -- Mini modules
  { src = "https://github.com/nvim-mini/mini.icons", name = "mini-icons" },

  -- Lualine
  { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },

})

require("plugins.theme")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.snacks")
require("plugins.mini")
require("plugins.lualine")
