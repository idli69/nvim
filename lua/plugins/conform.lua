return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "superhtml" },
      css = { "prettierd", "prettier", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", lsp_format = "fallback" },
      json = { "prettierd", "prettier", lsp_format = "fallback" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
