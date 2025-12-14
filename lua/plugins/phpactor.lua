return {
    "gbprod/phpactor.nvim",
    ft = "php",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
        -- If the update/install notification doesn't show properly,
        -- you should also add here UI plugins like "folke/noice.nvim" or "stevearc/dressing.nvim"
    },
    opts = {
        -- you're options goes here
        root_dir = vim.fn.getcwd(),
        ["completion_worse.completor.named_parameter.enabled"]  = false,
        ["completion_worse.completor.worse_parameter.enabled"]  = false,
    },
}
