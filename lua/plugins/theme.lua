return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    vim.opt.background = "dark"

    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_background = "soft"
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_better_performance = 1

    vim.g.gruvbox_material_transparent_background = 2
    vim.g.gruvbox_material_float_style = "blend"
    vim.g.gruvbox_material_menu_selection_background = "green"
    vim.g.gruvbox_material_ui_contrast = "low"
    vim.g.gruvbox_material_cursor = "auto"

    vim.cmd.colorscheme("gruvbox-material")

    -- Extra transparency overrides
    local transparent_groups = {
      "Normal",
      "NormalNC",
      "SignColumn",
      "EndOfBuffer",
      "LineNr",
      "FoldColumn",

      -- floating windows
      "NormalFloat",
      "FloatBorder",
      "FloatTitle",

      -- popup menu / completion menu
      "Pmenu",
      "PmenuSbar",
      "PmenuThumb",

      -- blink.cmp / nvim-cmp common groups
      "CmpNormal",
      "CmpBorder",
      "CmpDoc",
      "CmpDocBorder",
      "BlinkCmpMenu",
      "BlinkCmpMenuBorder",
      "BlinkCmpDoc",
      "BlinkCmpDocBorder",
    }

    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end

    -- Keep selected completion item visible
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3c3836", bold = true })
  end,
}
