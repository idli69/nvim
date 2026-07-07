# Neovim Configuration

A minimal, performant Neovim configuration built on lazy.nvim with native LSP, fuzzy finding, and a clean editor experience.

## Features

- Lazy-loaded plugin management via lazy.nvim
- LSP support for TypeScript (vtsls), Go (gopls), Svelte, Tailwind CSS, Lua, HTML, and CSS
- Auto-completion via blink.cmp with LSP, path, buffer, and snippet sources
- Treesitter-based syntax highlighting, folding, indentation, and incremental selection
- Fuzzy finding and live grep powered by snacks.nvim
- File explorer using oil.nvim (edit directories as buffers)
- Floating terminal via toggleterm.nvim
- Format-on-save with conform.nvim (stylua, prettierd/prettier, gofumpt)
- Statusline with lualine.nvim showing mode, filename, LSP status, diagnostics, and diff
- Catppuccin colorscheme (mocha flavour, transparent background)
- mini.nvim modules: basics, buffer removal, commenting, indentscope, clue (leader key hints)
- WakaTime integration for time tracking
- Neovim nightly UI2 enabled

## Screenshots

*(Coming soon)*

## Requirements

- **Neovim** >= 0.12 (nightly) — uses `vim._core.ui2` and the new `vim.lsp.config` API
- **git** — for cloning lazy.nvim on first launch
- **ripgrep** — recommended for snacks.nvim live grep
- **Nerd Font** — recommended for diagnostic signs and UI icons

External tools auto-installed via mason:
- `tree-sitter-cli`
- `stylua`
- `prettier` / `prettierd`
- `gofumpt`

## Installation

```bash
# Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Clone repository
git clone https://github.com/YOUR_USER_NAME/neovim-config.git ~/.config/nvim

# Start Neovim — lazy.nvim will auto-install and plugins will load
nvim
```

On first launch, lazy.nvim installs itself and all configured plugins. Restart Neovim for full functionality.

To update plugins:

```
:Lazy update
```

## Directory Structure

```
~/.config/nvim
├── init.lua                   # Entry point
├── lazy-lock.json             # Plugin lockfile
└── lua/
    ├── config/
    │   ├── lazy.lua           # lazy.nvim bootstrap and setup
    │   ├── options.lua        # Editor options and diagnostics config
    │   └── keymaps.lua        # Global and LSP key mappings
    └── plugins/               # Plugin specifications (one file per category)
        ├── blink.lua          # blink.cmp completion
        ├── colorscheme.lua    # Catppuccin theme
        ├── editor.lua         # snacks.nvim picker, oil.nvim file explorer
        ├── lsp.lua            # nvim-lspconfig, mason, conform.nvim
        ├── mini.lua           # mini.nvim modules (basics, bufremove, comment, indentscope, clue)
        ├── misc.lua           # wakatime, lazydev.nvim
        ├── toggleterm.lua     # Floating terminal
        ├── treesitter.lua     # Treesitter and treesitter-modules
        └── ui.lua             # lualine.nvim statusline
```

## Keymaps

Leader key is `<Space>`.

### General

| Key | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| `<C-d>` | Scroll down and center cursor |
| `<C-u>` | Scroll up and center cursor |
| `n` | Next search result and center |
| `N` | Previous search result and center |

### Window Navigation

| Key | Action |
|---|---|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |
| `<leader>w` | Save file |
| `<leader>q` | Quit current window |
| `<leader>Q` | Quit all without saving |

### Editing

| Key | Mode | Action |
|---|---|---|
| `A-J` | Visual | Move selection down |
| `A-K` | Visual | Move selection up |
| `<` | Visual | Indent left and reselect |
| `>` | Visual | Indent right and reselect |

### Clipboard

| Key | Mode | Action |
|---|---|---|
| `<leader>y` | Normal, Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>p` | Normal, Visual | Paste from system clipboard |
| `<leader>d` | Normal, Visual | Delete without copying |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | List references |
| `K` | Show hover documentation |
| `J` | Show diagnostics float |
| `ga` | Code action |
| `gn` | Rename symbol |
| `<leader>uh` | Toggle inlay hints |

### Terminal

| Key | Action |
|---|---|
| `<Esc>` | Exit terminal mode |
| `<leader>t` | Toggle floating terminal |

### Plugin-Specific

| Key | Action | Plugin |
|---|---|---|
| `<leader>ff` | Find files (smart) | snacks.nvim picker |
| `<leader>fg` | Live grep | snacks.nvim picker |
| `<leader>fh` | Help files | snacks.nvim picker |
| `<leader>fo` | Recent files | snacks.nvim picker |
| `<leader>e` | Open file explorer | oil.nvim |

## LSP Setup

LSP servers are configured via `nvim-lspconfig` and auto-installed through `mason.nvim` + `mason-lspconfig.nvim`. Tools (formatters, linters) are auto-installed via `mason-tool-installer.nvim`.

**Configured LSP servers:** `vtsls`, `gopls`, `svelte`, `tailwindcss`, `lua_ls`, `html`, `cssls`

**Configured formatters:** `stylua` (Lua), `prettierd` / `prettier` (HTML, CSS, TypeScript, JavaScript, Svelte), `gofumpt` (Go)

Formatting runs automatically on save with a 500ms timeout via `conform.nvim`, falling back to LSP formatting when no formatter is configured.

Diagnostics are configured with severity-sorted display, bordered float windows, and icon-based sign column markers.

Tailwind CSS is configured with custom `classRegex` settings for class extraction.

