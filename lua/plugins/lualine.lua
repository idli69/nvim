return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = false,
      theme = "auto",
      component_separators = "",
      section_separators = "",
      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "filename" },
      lualine_x = { "diagnostics" },
      lualine_y = { "filetype" },
      lualine_z = {
        { "location", padding = { left = 0, right = 1 } },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
