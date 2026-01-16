return {
    "rmagatti/auto-session",
    event = "VeryLazy",

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    -- opts = {
    --     -- log_level = 'debug',
    -- },

    config = function ()
        require("auto-session").setup({
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" }, -- or whatever dashboard you use
            auto_restore = false,                                            -- Enables/disables auto restoring session on start
        })
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,

    -- Telescope only: If load_on_setup is false, make sure you use `:AutoSession search` to open the picker as it will initialize everything first
    load_on_setup = true,
}
