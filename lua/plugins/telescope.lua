return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        'andrew-george/telescope-themes',
    },
    config = function()
        -- load extension
        local telescope = require('telescope')
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        -- telescope.load_extension('fzf')
        telescope.load_extension('themes')
        telescope.setup({
            extensions = {
                themes = {
                    -- you can add regular telescope config

                    light_themes = {
                        ignore = true,
                        keywords = { "light", "day", "latte", "dawn" }
                    },

                    -- that you want to apply on this picker only
                    layout_config = {
                        horizontal = {
                            width = 0.8,
                            height = 0.7,
                        },
                    },

                    -- extension specific config

                    -- (boolean) -> show/hide previewer window
                    enable_previewer = true,

                    -- (boolean) -> enable/disable live preview
                    enable_live_preview = true,

                    persist = {
                        -- enable persisting last theme choice
                        enabled = true,

                        -- override path to file that execute colorscheme command
                        path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
                    },

                },
            },
        })
    end,

    vim.keymap.set("n", "<leader>tt", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
}
