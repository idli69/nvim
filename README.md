# Neovim Config

Minimal Neovim config. Native LSP, lazy.nvim, vague colorscheme.

## Requirements

- Neovim >= 0.12 (nightly)
- git, ripgrep, Nerd Font

## Plugins

| Plugin | Purpose |
|--------|---------|
| blink.cmp | Completion |
| snacks.nvim | Picker (find files, grep) |
| oil.nvim | File explorer |
| nvim-lspconfig + mason | LSP |
| conform.nvim | Formatting |
| nvim-treesitter | Syntax |
| mini.nvim | Pairs, surround, comment, indent, clue |
| lualine.nvim | Statusline |
| vague.nvim | Colorscheme |

## Keymaps

Leader: `<Space>`

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fo` | Recent files |
| `<leader>e` | File explorer |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover |
| `ga` | Code action |
| `gn` | Rename |
| `<leader>uh` | Toggle inlay hints |
| `<C-d/u>` | Scroll center |
| `J` (normal) | Diagnostics float |
| `J/K` (visual) | Move lines |

## Structure

```
lua/
├── config/
│   ├── lazy.lua        # Bootstrap
│   ├── options.lua     # Editor settings
│   └── keymaps.lua     # Keybindings
└── plugins/
    ├── blink.lua       # Completion
    ├── colorscheme.lua # Vague theme
    ├── editor.lua      # Snacks + Oil
    ├── lsp.lua         # LSP + Mason + Conform
    ├── mini.lua        # Mini modules
    ├── misc.lua        # Wakatime
    ├── treesitter.lua  # Treesitter
    └── ui.lua          # Lualine
```
