return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require("configs.conform"),
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
            require("configs.alpha-nvim")
        end,
    },

    --[[ {
		"nvimtools/none-ls.nvim",

		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VimEnter",
		config = function()
			local none_ls = require("null-ls")

			none_ls.setup({
				sources = {
					none_ls.builtins.formatting.stylua,
					none_ls.builtins.diagnostics.eslint,
					none_ls.builtins.completion.spell,
					-- PHP formatting (php-cs-fixer)
					none_ls.builtins.formatting.phpcsfixer.with({
						command = "php-cs-fixer",
						args = { "fix", "--using-cache=no", "--quiet", "$FILENAME" },
					}),

					-- PHP linting (phpcs)
					none_ls.builtins.diagnostics.phpcs.with({
						command = "phpcs",
						args = { "--standard=PSR12", "--report=emacs", "-s", "-" },
					}),
				},
			})

			-- Autoformat on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.php",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	}, ]]

    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
    },


    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({})
        end,
    },

    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        "tiagovla/scope.nvim",
        config = true,
    },


    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        ---@diagnostic disable-next-line: duplicate-index
        config = true,
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
        opts = {},

        ---@diagnostic disable-next-line: duplicate-index
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                ts_config = {
                    lua = { "string" }, -- it will not add a pair on that treesitter node
                    javascript = { "template_string" },
                    java = false,       -- don't check treesitter on java
                    php = { "string" },
                },
            })
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    {
        "NvChad/nvterm",
        config = function()
            require("configs.nvterm")
        end,
    },
}
