# Neovim Config (nvim6581)

This is my personal Neovim configuration, based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with customizations:

- **Mason v2** (`mason-org/mason.nvim`, `mason-lspconfig.nvim`, `mason-tool-installer.nvim`)
- **Blink.cmp** for completions (`saghen/blink.cmp`)
- **Conform.nvim** for formatting on save
- **LSP setup** for C, C++, Python, Lua (clangd, pyright, ruff, lua_ls)
- **Telescope** for navigation (`grd`, `grr`, etc.)
- Custom `.editorconfig`, `.clang-format` for style consistency

---

## Installation

Clone this repo into your Neovim config directory:

```bash
git clone git@github.com:Beep6581/nvim6581.git ~/.config/nvim
```

Then open Neovim:

```bash
nvim
```

Lazy.nvim will bootstrap itself and install all plugins.

---

## Updating plugins

Inside Neovim:

```vim
:Lazy sync
:MasonUpdate
```

---

## First-time setup checks

Run:

```vim
:checkhealth
:LspInfo
```

- Make sure LSP servers are installed (Mason should auto-install).
- Ensure `clang`, `python`, and other dev tools are installed on your system.

---

## Keymaps (LSP highlights)

- `grd` → Go to Definition (Telescope, fallback to LSP jump)
- `grr` → References
- `gri` → Implementations
- `grt` → Type Definitions
- `grn` → Rename
- `gra` → Code Actions
- `K`   → Hover documentation

---
## Notes

- `lazy-lock.json` is not tracked.
- `spell/` and machine caches are ignored via `.gitignore`.
- Formatters: `clang-format` (C/C++), `ruff` (Python lint/format), `black` (Python formatting).
- Completion: Blink.cmp + fuzzy Rust backend.

---

## Project Config Templates

This repo also includes style/configuration templates you can copy into your own projects:

- `.editorconfig` → consistent indentation, line endings, trailing whitespace rules
- `.clang-format` → C/C++ formatting style
- `.clang-tidy` → C/C++ linting/analysis rules

They are stored under `templates/`.

To use them in a project, copy them into the project root:

```bash
cp ~/.config/nvim/templates/.editorconfig ~/myproject/
cp ~/.config/nvim/templates/.clang-format ~/myproject/
cp ~/.config/nvim/templates/.clang-tidy ~/myproject/
```

Neovim (via Conform, LSP, etc.) and other tools will then automatically respect these configs.

---
