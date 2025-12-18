---@diagnostic disable: unused-local
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lazy_status = require("lazy.status")
        local lualine = require("lualine")

        local colors = {
            color0 = "#092236",
            color1 = "#ff5874",
            color2 = "#c3ccdc",
            color3 = "#1c1e26",
            color6 = "#a1aab8",
            color7 = "#828697",
            color8 = "#ae81ff",
        }

        local my_lualine_theme = {
            replace = {
                a = { fg = colors.color0, bg = colors.color1, gui = "bold" },
                b = { fg = colors.color2, bg = colors.color3 },
            },
            inactive = {
                a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
                b = { fg = colors.color6, bg = colors.color3 },
                c = { fg = colors.color6, bg = colors.color3 },
            },
            normal = {
                a = { fg = colors.color0, bg = colors.color7, gui = "bold" },
                b = { fg = colors.color2, bg = colors.color3 },
                c = { fg = colors.color2, bg = colors.color3 },
            },
            visual = {
                a = { fg = colors.color0, bg = colors.color8, gui = "bold" },
                b = { fg = colors.color2, bg = colors.color3 },
            },
            insert = {
                a = { fg = colors.color0, bg = colors.color2, gui = "bold" },
                b = { fg = colors.color2, bg = colors.color3 },
            },
        }

        local mode = {
            'mode',
            fmt = function(str)
                -- return ' '
                -- displays only the first character of the mode
                return ' ' .. str
            end,
        }

        local diff = {
            'diff',
            colored = true,
            symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
            -- cond = hide_in_width,
        }

        local filename = {
            'filename',
            file_status = true,
            path = 0,
        }

        local lsp_status = {
            'lsp_status',
            icon = '', -- f013
            symbols = {
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                -- Standard unicode symbol for when LSP is done:
                done = '✓',
                -- Delimiter inserted between LSP names:
                separator = ' ',
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
            -- Display the LSP name
            show_name = true,
        }

        local diagnostics = {
            'diagnostics',

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { 'nvim_diagnostic', 'coc' },

            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
            },
            symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false,   -- Show diagnostics even if there are none.
        }

        local branch = { 'branch', icon = { '', color = { fg = '#A6D4DE' } }, '|' }

        lualine.setup({
            icons_enabled = true,

            options = {
                -- theme = "iceberg_dark",
                theme = my_lualine_theme,
                globalstatus = true,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "|", right = "|" },
            },

            sections = {
                lualine_a = { mode },
                lualine_b = { branch },
                lualine_c = {diff, filename},
                lualine_x = {
                    { "diagnostics" },
                    {
                        -- require("noice").api.statusline.mode.get,
                        -- cond = require("noice").api.statusline.mode.has,
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    -- { "encoding",},
                    { "fileformat" },
                    { "filetype" },
                    { "lsp_status" },
                },
                -- lualine_y = {},
                -- lualine_z = {},
            },
        })
    end,
}
