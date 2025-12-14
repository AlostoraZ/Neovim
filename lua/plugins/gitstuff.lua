return {
    -- for all git plugins
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gi", vim.cmd.Git, { desc = "git fugitive" })

            local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = myFugitive,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }

                    vim.keymap.set("n", "<leader>P", function()
                        vim.cmd.Git('push')
                    end, opts, {desc = "push"})

                    -- NOTE: rebase always
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git({ 'pull', '--rebase' })
                    end, opts)

                    -- NOTE: easy set up branch that wasn't setup properly
                    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
                end,
            })
        end,
    },


    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk" })
                    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk" })

                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = "Stage hunk" })

                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, { desc = "Reset hunk" })

                    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "Stage buffer" })
                    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "Reset buffer" })
                    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview hunk" })
                    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

                    map('n', '<leader>hb', function()
                        gitsigns.blame_line({ full = true })
                    end, { desc = "Blame line" })

                    map('n', '<leader>hd', gitsigns.diffthis, { desc = "Show diff" })

                    map('n', '<leader>hD', function()
                        gitsigns.diffthis('~')
                    end, { desc = "Show diff home" })

                    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end,
                        { desc = "Set quickfix with changes repo" })
                    map('n', '<leader>hq', gitsigns.setqflist, { desc = "Set quickfix with changes" })

                    -- Toggles
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle blame line" })
                    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

                    -- Text object
                    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = "Select hunk" })
                end
            }
        end,
    },


    {
        "kdheepak/lazygit.nvim",
        -- NOTE: tryine lazygit with snacks
        enabled = false,
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            require("telescope").load_extension("lazygit")
        end,
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    }
}
