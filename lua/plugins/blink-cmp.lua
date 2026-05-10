--- @diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      ghost_text = {
        enabled = true,
        show_with_menu = false
      },
      menu = {
        auto_show = false,
        scrollbar = false,
      },
      documentation = {
        auto_show = false,
        window = {
          scrollbar = false,
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
