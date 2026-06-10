# TODO

## Clean orphaned plugins

The lock file (`nvim-pack-lock.json`) contains ~20 entries from the old config that are
no longer declared in `lua/plugins/init.lua` but are still installed on disk. Run this
once inside Neovim to remove them:

```
:lua vim.pack.clean()
```

Orphaned plugins include the old nvim-cmp completion stack, vim-fugitive, harpoon,
lightline, copilot.lua, and several unused themes.
