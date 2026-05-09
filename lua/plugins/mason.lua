return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
  },

  opts = {
    automatic_enable = true,
    ensure_installed = {
      "emmylua_ls",
      "superhtml",
      "cssls",
      "emmet_language_server",
      "vtsls"
    },
  },
}
