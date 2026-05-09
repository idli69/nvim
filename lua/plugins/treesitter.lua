return {
  'MeanderingProgrammer/treesitter-modules.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ---@module 'treesitter-modules'
  ---@type ts.mod.UserConfig
  opts = {
    ensure_installed = {
        -- WEB DEV
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "toml",
        "bash",
        "regex",
        -- LUA / NEOVIM
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        -- MARKDOWN
        "markdown",
        "markdown_inline",
        -- GIT
        "git_config",
        "gitignore",
    },
    auto_install = true,
    fold = {
      enable = true,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<cr>',
        node_incremental = '<cr>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
    indent = {
      enable = true,
    },
  },
}
