local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		php = { "php-cs-fixer" },
		-- css = { "prettier" },
		-- html = { "prettier" },
	},
	formatters = {
		["php-cs-fixer"] = {
			command = "php-cs-fixer",
			args = {
				"fix",
				"--config=.php-cs-fixer.php", -- Specify your config file
				"--using-cache=no", -- Optional: disable cache for immediate effect
				"$FILENAME",
			},
			stdin = false,
		},
	},
	notify_on_error = true,

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

return options
