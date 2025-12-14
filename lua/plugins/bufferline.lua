return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                mode = "buffers",

                separator_style = { "", "" },

                indicator = {
                    style = "none",
                },

                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },

                groups = {
                    items = {
                        require("bufferline.groups").builtin.pinned:with({ icon = "󰐃 " }),
                    },
                },

                style_preset = bufferline.style_preset.no_italic,

                diagnostics = "nvim_lsp",

                ---@diagnostic disable-next-line: unused-local
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            },

        })
    end,
}
