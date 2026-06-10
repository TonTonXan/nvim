-- crates.nvim: shows latest crate versions inline and manages Cargo.toml dependencies.
require("crates").setup()

-- venv-selector: detects and activates the correct Python virtualenv per project,
-- ensuring pyright and the debugger use the right interpreter.
require("venv-selector").setup({ auto_refresh = true })

-- cmake-tools: build, run, and debug CMake targets without leaving Neovim.
require("cmake-tools").setup({})
