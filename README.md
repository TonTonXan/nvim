# Neovim Configuration

Personal Neovim 0.11+ configuration for C/C++, Python, Rust, Bash, and embedded development (Bitbake, DeviceTree). Runs on WSL2.

Uses the built-in `vim.pack` package manager — no lazy.nvim or other plugin manager required.

---

## Requirements

| Tool | Purpose |
|------|---------|
| Neovim ≥ 0.11 | Required for `vim.pack`, `vim.lsp.enable()`, and built-in `gc` commenting |
| Nerd Font | Icons (set `TERM` font in your terminal emulator) |
| `cmake` + `make` | Build `telescope-fzf-native` (one-time, see Setup) |
| `git` | Plugin installation |
| WSL2 | Clipboard bridge via `clip.exe` is configured; remove `vim.g.clipboard` in `options.lua` if not on WSL2 |

External tools installed via `:Mason` (run after first launch):

```
clangd          pyright         rust-analyzer   lua-language-server
bash-language-server  taplo    yaml-language-server  json-lsp
clang-format    stylua          ruff            shfmt
cmake-format    rustfmt         yamlfmt         taplo
clang-tidy      shellcheck      codelldb        debugpy
```

---

## Structure

```
~/.config/nvim/
├── init.lua                  Entry point; loads all modules in order
├── lua/
│   ├── options.lua           Editor options (vim.opt)
│   ├── autocmds.lua          Autocommands (yank highlight, LSP attach, format-on-save, lint)
│   ├── keymaps.lua           All keymaps
│   └── plugins/
│       ├── init.lua          Plugin declarations (vim.pack.add)
│       ├── appearance.lua    Theme, statusline, treesitter, indent guides
│       ├── lsp.lua           LSP servers, Mason, conform, nvim-lint, blink.cmp
│       ├── navigation.lua    Oil, Telescope + fzf-native
│       ├── git.lua           gitsigns
│       ├── ai.lua            CopilotChat
│       ├── debug.lua         nvim-dap (codelldb for C/C++/Rust, debugpy for Python)
│       ├── testing.lua       neotest (pytest, cargo test, GoogleTest)
│       ├── tools.lua         crates.nvim, venv-selector, cmake-tools
│       └── utils.lua         which-key, todo-comments, autopairs, nvim-surround
└── TODO.md                   Pending manual actions
```

---

## Plugins

### Appearance
| Plugin | Role |
|--------|------|
| `navarasu/onedark.nvim` | Colorscheme (deep style) |
| `nvim-lualine/lualine.nvim` | Statusline |
| `nvim-treesitter/nvim-treesitter` | Syntax highlighting and parsing |
| `nvim-treesitter/nvim-treesitter-textobjects` | `af`/`if` function, `ac`/`ic` class text objects |
| `nvim-tree/nvim-web-devicons` | File type icons |
| `lukas-reineke/indent-blankline.nvim` | Visual indent guides |
| `ntpeters/vim-better-whitespace` | Trailing whitespace highlighting |
| `folke/trouble.nvim` | Diagnostics panel |

### LSP & Formatting
| Plugin | Role |
|--------|------|
| `neovim/nvim-lspconfig` | LSP server configurations |
| `mason-org/mason.nvim` | Install LSP servers and tools |
| `mason-org/mason-lspconfig.nvim` | Bridge Mason installs to `vim.lsp.enable()` |
| `stevearc/conform.nvim` | Formatting (runs on save) |
| `mfussenegger/nvim-lint` | Linting (clang-tidy, ruff, shellcheck) |
| `lewis6991/fidget.nvim` | LSP progress spinner |
| `p00f/clangd_extensions.nvim` | clangd extras: inlay hints, AST view, header/source switch |
| `mrcjkb/rustaceanvim` | Full rust-analyzer integration |

### Completion
| Plugin | Role |
|--------|------|
| `saghen/blink.cmp` | Completion engine (LSP, path, snippets, buffer, Copilot) |
| `fang2hou/blink-copilot` | Copilot source for blink.cmp |

### Navigation
| Plugin | Role |
|--------|------|
| `stevearc/oil.nvim` | File explorer (edit filesystem like a buffer) |
| `nvim-telescope/telescope.nvim` | Fuzzy finder |
| `nvim-telescope/telescope-fzf-native.nvim` | Native C sorter for Telescope (faster) |

### Git
| Plugin | Role |
|--------|------|
| `kdheepak/lazygit.nvim` | Full-screen LazyGit inside Neovim |
| `lewis6991/gitsigns.nvim` | Inline git blame and hunk indicators |

### Debugging
| Plugin | Role |
|--------|------|
| `mfussenegger/nvim-dap` | Debug Adapter Protocol client |
| `rcarriga/nvim-dap-ui` | Debug UI (auto-opens on session start) |
| `mfussenegger/nvim-dap-python` | Python debug adapter (debugpy) |
| `jay-babu/mason-nvim-dap.nvim` | Install debug adapters via Mason |

### Testing
| Plugin | Role |
|--------|------|
| `nvim-neotest/neotest` | Unified test runner UI |
| `nvim-neotest/neotest-python` | pytest adapter |
| `rouge8/neotest-rust` | cargo test adapter |
| `alfaix/neotest-gtest` | GoogleTest adapter (requires pre-built binary) |

### Language Tools
| Plugin | Role |
|--------|------|
| `Saecki/crates.nvim` | Cargo.toml: inline crate versions, upgrade |
| `linux-cultist/venv-selector.nvim` | Python virtualenv detection and activation |
| `Civitasv/cmake-tools.nvim` | Build, run, and debug CMake targets |

### AI
| Plugin | Role |
|--------|------|
| `github/copilot.vim` | Inline Copilot suggestions |
| `CopilotC-Nvim/CopilotChat.nvim` | Copilot chat panel (using claude-sonnet-4.6) |

### Utilities
| Plugin | Role |
|--------|------|
| `folke/which-key.nvim` | Keymap popup on `<leader>` |
| `folke/todo-comments.nvim` | Highlight `TODO`, `FIXME`, `NOTE`, `HACK`, `WARN` |
| `windwp/nvim-autopairs` | Auto-close brackets and quotes |
| `kylechui/nvim-surround` | `ys`/`ds`/`cs` to add/delete/change surrounding pairs |
| `nvim-lua/plenary.nvim` | Lua utility library (dependency) |

---

## Keymaps

Leader key: `<Space>`

### Navigation
| Key | Action |
|-----|--------|
| `<leader>e` | Open Oil (file explorer) |
| `<C-h/j/k/l>` | Move between windows |
| `<leader>sv/sh/se/sx` | Split vertical / horizontal / equalize / close |
| `<leader>bn/bp/bd` | Next / previous / delete buffer |

### Find (Telescope) — `<leader>f`
| Key | Action |
|-----|--------|
| `<leader>fe` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>ft` | Git files |
| `<leader>fu` | Word under cursor |
| `<leader>fd` | Diagnostics |
| `<leader>ff/fc/fv` | Workspace functions / classes / variables |
| `<leader>fs` | All workspace symbols |
| `<leader>fr` | Resume last picker |

### LSP — `<leader>l`
| Key | Action |
|-----|--------|
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gt` | Goto type definition |
| `gi` | Goto implementation |
| `gr` | Goto references |
| `K` | Hover documentation |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code action |
| `<leader>lf` | Format buffer (also runs on save) |
| `]d` / `[d` | Next / previous diagnostic |

### Debug — `<leader>d`
| Key | Action |
|-----|--------|
| `<leader>dc` | Continue / start session |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dn` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dx` | Terminate session |
| `<leader>du` | Toggle DAP UI |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last configuration |

### Testing — `<leader>n`
| Key | Action |
|-----|--------|
| `<leader>nt` | Run nearest test |
| `<leader>nf` | Run test file |
| `<leader>nl` | Run last test |
| `<leader>ns` | Toggle test summary panel |
| `<leader>no` | Show test output |

### Treesitter Text Objects
| Key | Action |
|-----|--------|
| `af` / `if` | Outer / inner function |
| `ac` / `ic` | Outer / inner class |
| `aa` / `ia` | Outer / inner parameter |
| `]f` / `[f` | Jump to next / previous function |
| `]c` / `[c` | Jump to next / previous class |

### Git — `<leader>g`
| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |

### CMake — `<leader>m`
| Key | Action |
|-----|--------|
| `<leader>mb` | Build |
| `<leader>mr` | Run |
| `<leader>mc` | Clean |
| `<leader>mp` | Select build preset |
| `<leader>mt` | Select build target |

### Python — `<leader>p`
| Key | Action |
|-----|--------|
| `<leader>pv` | Select Python virtualenv |

### Crates — `<leader>C` (Cargo.toml only)
| Key | Action |
|-----|--------|
| `<leader>Cv` | Show crate versions |
| `<leader>Cf` | Show crate features |
| `<leader>Cu` | Upgrade crate under cursor |
| `<leader>CU` | Upgrade all crates |
| `<leader>Ct` | Toggle inline version display |

### Copilot — `<leader>c`
| Key | Action |
|-----|--------|
| `<C-Right>` (insert) | Accept next word |
| `<S-Tab>` (insert) | Accept full suggestion |
| `<leader>cc` | Toggle CopilotChat panel |
| `<leader>ce` | Explain current line |
| `<leader>cs/cr/cm` | Stop / reset / list models |

### Surround (`nvim-surround`)
| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surrounding |
| `ds{char}` | Delete surrounding |
| `cs{old}{new}` | Change surrounding |

---

## Setup

### First launch

1. Open Neovim. `vim.pack` installs all declared plugins automatically.
2. Run `:Mason` and install the required tools listed above.
3. Build `telescope-fzf-native` (required for fast fuzzy matching):

```sh
cd ~/.local/share/nvim/pack/*/start/telescope-fzf-native.nvim
cmake . -B build && cmake --build build
```

4. Run `:lua vim.pack.clean()` to remove any orphaned plugins from previous configurations.

### clang-tidy

`clang-tidy` requires a `compile_commands.json` in the project root to resolve includes. Generate it with CMake:

```sh
cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -s build/compile_commands.json compile_commands.json
```

### GoogleTest (neotest-gtest)

The GoogleTest neotest adapter requires the test binary to be built before running tests via `<leader>nt`. Build the project first with `<leader>mb`, then run tests.

---

## Updating plugins

```
:lua vim.pack.update()
```
