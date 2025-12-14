---@diagnostic disable: undefined-global

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
})

local servers = {
    "intelephense",
    "biome",
    "luals",
    "sqlls",
    "phpcs",
    "php-cs-fixer",
    "emmet-ls",
    "emmet-language-server",
    "prettier",
    "html-lsp",
    "pyright",
    "qmlls",
    "eslint-lsp",
    "eslint_d",
    "pretty-php",
    "phpstan",
}

vim.lsp.config["php-cs-fixer"] = {
}

vim.lsp.config["phpstan"] = {
    cmd = { "phpstan", "--stdio" },
    filetypes = { "php" },
}

vim.lsp.config["intelephense"] = {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    init_options = {
        licenceKey = "", -- optional if you have a premium key
    },
}

vim.lsp.config["emmet-language-server"] = {
    cmd = { "emmet-language-server", "--stdio" },
    root_dir = vim.fn.getcwd(),
    capabilities = capabilities,
    filetypes = {
        "html",
        "css",
        "php",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "svelte",
        "blade",
        "pug",
        "scss",
        "less",
    },
    init_options = {
        -- optional emmet options; leave empty table if you don't need them
        html = {
            options = {
                ["bem.enabled"] = true,
            },
        },
        ---@type table<string, string>
        includeLanguages = {},
        --- @type string[]
        excludeLanguages = {},
        --- @type string[]
        extensionsPath = {},
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
        preferences = {},
        --- @type boolean Defaults to `true`
        showAbbreviationSuggestions = true,
        --- @type "always" | "never" Defaults to `"always"`
        showExpandedAbbreviation = "always",
        --- @type boolean Defaults to `false`
        showSuggestionsAsSnippets = false,
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
        syntaxProfiles = {},
        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
        variables = {},
    },
}

vim.lsp.config["prettier"] = {
    bin = "prettier", -- or `'prettierd'` (v0.23.3+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "php",
    },
}

vim.lsp.config["biome"] = {
    cmd = function(dispatchers, config)
        local cmd = "biome"
        local local_cmd = (config or {}).root_dir and config.root_dir .. "/node_modules/.bin/biome"
        if local_cmd and vim.fn.executable(local_cmd) == 1 then
            cmd = local_cmd
        end
        return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
    end,
    filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "vue",
    },
}

vim.lsp.config["emmet-ls"] = {
    filetypes = { "html", "css", "php", "blade", "javascriptreact", "typescriptreact" },
    init_options = {
        html = {
            options = {
                ["bem.enabled"] = true,
            },
        },
    },
}

vim.lsp.config["luals"] = {

    -- Command and arguments to start the server.
    cmd = { "lua-language-server" },
    -- Filetypes to automatically attach to.

    filetypes = { "lua" },
    -- Sets the "workspace" to the directory where any of these files is found.

    -- Files that share a root directory will reuse the LSP server connection.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    -- Specific settings to send to the server. The schema is server-defined.
    -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
        },
    },
}

vim.lsp.config["html-lsp"] = {
    filetypes = {
        "html",
        "php",
    },
}

vim.lsp.config["css-lsp"] = {
    filetypes = {
        "css",
        "html",
        "php",
    },
}

vim.lsp.config["qmlls"] = {
    -- capabilities = capabilities,
    -- 		on_attach = on_attach,
    cmd = { "qmlls" },
    filetypes = { "qml" },
    -- 		single_file_support = true,
    -- 		root_dir = function(fname)
    -- 			return lspconfig.util.find_git_ancestor(fname)
    -- 		end,
}
vim.lsp.enable(servers)
