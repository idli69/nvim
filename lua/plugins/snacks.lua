-- ~/.config/nvim/lua/plugins/snacks.lua

return {
  "folke/snacks.nvim",
  event = "UIEnter",
  opts = {
    -- 1. Essential Performance & Core UI
    bigfile = { enabled = true }, -- Prevents Neovim from crashing on massive files
    quickfile = { enabled = true }, -- Faster file loading from the terminal
    input = { enabled = true }, -- Clean, lightweight UI for renaming/inputs
    picker = { enabled = true, ui_select = true, layout = { preset = "telescope" } }, -- The core Telescope replacement
    notifier = { enabled = true, timeout = 3000 }, -- Minimal notifications

    -- 2. Disabled Bloat (Protecting CPU & Memory)
    dashboard = { enabled = false }, -- No startup screen = instant boot
    explorer = { enabled = false }, -- You are already using oil.nvim
    indent = { enabled = false }, -- High CPU overhead on scroll
    scope = { enabled = false }, -- High CPU overhead on cursor move
    scroll = { enabled = false }, -- Animation lag on low-spec CPUs
    statuscolumn = { enabled = false },
    words = { enabled = false }, -- Redundant with LSP highlighting
  },
  keys = {
    -- Core Pickers
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep Workspace",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },

    -- LSP & Diagnostics (Snacks replaces heavy plugins like Trouble)
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "<leader>fD",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Workspace Diagnostics",
    },
    {
      "<leader>fd",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },

    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
  },
}
