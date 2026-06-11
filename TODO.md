# TODO

## Build telescope-fzf-native (REQUIRED for fast fuzzy search)

The fzf sorter requires a compiled C library. Without it telescope works but is slower,
and a warning is shown on startup. Run once in WSL:

```sh
cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
cmake . -B build && cmake --build build
```

Requires `cmake` and `make` (install with `sudo apt install cmake build-essential`).

---

## Install win32yank (clipboard)

`win32yank.exe` eliminates the ~300-500ms paste delay caused by PowerShell startup.
Without it the config falls back to clip.exe + PowerShell, which works but is slow.

Run in WSL:

```sh
curl -sLo /tmp/win32yank.zip \
  https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

Verify with `win32yank.exe --version`. Neovim picks it up automatically on next launch.

---

## Clean orphaned plugins

The lock file (`nvim-pack-lock.json`) contains ~20 entries from the old config that are
no longer declared in `lua/plugins/init.lua` but are still installed on disk. Run this
once inside Neovim to remove them:

```
:lua vim.pack.clean()
```

Orphaned plugins include the old nvim-cmp completion stack, vim-fugitive, harpoon,
lightline, copilot.lua, and several unused themes.
