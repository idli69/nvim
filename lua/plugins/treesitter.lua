require('treesitter-modules').setup({
  ensure_installed = {
    -- Web
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "svelte",

    -- Backend
    "go",
    "python",
    "lua",
    "luadoc",
    "bash",

    -- Config
    "toml",
    "ini",
    "git_config",

    -- Markup
    "markdown",
    "markdown_inline",

    -- Git
    "gitignore",
    "gitcommit",
    "git_rebase",

    -- Documentation
    "regex",
    "comment",
    "query",

    -- Other useful
    "vim",
    "vimdoc",
    "diff",
    "printf",
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
})
