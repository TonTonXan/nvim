-- Use :lua vim.pack.update() to update the plugins
vim.pack.add({

    -- Appearance
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

    -- Git related
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- Onedark theme config
local onedark = require('onedark')
onedark.setup{
    style = 'deep',
    transparent = false,
    term_colors = true,
    ending_tildes = true,
    cmp_itemkind_reverse = false,

    -- Change code style
    -- Options are italic, bold, underline, none. They can stack
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "bold",
        strings = "none",
        variables = "none"
    },

    -- lualine = { transparent = false },
}
onedark.load()

-- Lualine config
local lualine = require('lualine')
lualine.setup{
    options = {
        theme = 'onedark'
    },
}

-- Gitsigns config
require('gitsigns').setup()

