local servers = {
  "emmylua_ls",
  "stylua",

  "gopls",

  "pyrefly",

  "zls",

  "vtsls",
  "html",
  "cssls",
  "emmet_language_server",
}

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
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
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = servers,
      },
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          zig = { "zigfmt" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      },
    },
  },
  opts = {
    automatic_enable = true,
  },
}
