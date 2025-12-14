return {
    {
        -- lua/plugins/rose-pine.lua
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({})
            --vim.cmd("colorscheme rose-pine")
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        ---@diagnostic disable-next-line: duplicate-index
        config = true,
        opts = ...,
        ---@diagnostic disable-next-line: duplicate-index
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
            })
            -- vim.cmd("colorscheme gruvbox")
        end,
    },

    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                transparent_background_level = 2, -- Your config here
            })
            -- vim.cmd("colorscheme everforest")
        end,
    },

    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("onedark").setup({
                style = "darker",
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                    bars = "transparent",
                },
            })
            -- Enable theme
            -- require("onedark").load()
            -- vim.cmd("colorscheme onedark")
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                    bars = "transparent",
                },
            })
            -- vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                float = {
                    transparent = true,    -- enable transparent floating windows
                    solid = false,          -- use solid styling for floating windows, see |winborder|
                },
                term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false,        -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15,      -- percentage of the shade to apply to the inactive window
                },
            })
        end,

        -- setup must be called before loading
        -- vim.cmd.colorscheme "catppuccin"
    },
}
