return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Setup language servers.
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.emmet_language_server.setup({
            filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "pug",
                "typescriptreact",
                "latex",
                "markdown"
            },
            -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
            -- **Note:** only the options listed in the table are supported.
            init_options = {
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
        })
        lspconfig.svelte.setup({})
        lspconfig.clangd.setup({})
        lspconfig.tailwindcss.setup({})
        lspconfig.rust_analyzer.setup({
            -- Server-specific settings. See `:help lspconfig-setup`
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        })
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        --
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Diagnostic Go to previous" })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Diagnostic Go to next" })
        vim.keymap.set("n", "<space>df", vim.diagnostic.open_float, { desc = "Diagnostic Open Float" })
        vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist, { desc = "Diagnostic Set local list" })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }, opts )
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" }, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover,{ desc = "Hover information" },  opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation,  { desc = "Go to implementation" }, opts)
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" }, opts )
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to reference" }, opts )
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ desc = "Rename" }, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                    { desc = "Display code actions" }, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" }, opts)
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder,
                    { desc = "Add Workspace Folder" }, opts)
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder,
                    { desc = "Remove Workspace Folder" }, opts)
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, { desc = "List Workspace Folders" }, opts)
                vim.keymap.set("n", "<space>0", function()
                    vim.lsp.buf.format({ async = true })
                end, { desc = "Format buffer" }, opts)
            end,
        })
    end,
}
