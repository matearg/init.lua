return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            { "williamboman/mason-lspconfig.nvim" },
            { "pmizio/typescript-tools.nvim", opts = {} },
            {
                "saghen/blink.cmp",
                dependencies = { "rafamadriz/friendly-snippets" },
                version = "1.*",
            },
        },
        config = function()
            -- Configure error/warnings interface
            vim.diagnostic.config({
                virtual_text = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local set = vim.keymap.set

                    set("n", "gd", function()
                        vim.lsp.buf.definition()
                    end, opts)
                    set("n", "K", function()
                        vim.lsp.buf.hover({ border = "rounded" })
                    end, opts)
                    set("n", "ff", function()
                        vim.diagnostic.open_float()
                    end, opts)
                    set("n", "<leader>gs", function()
                        require("telescope.builtin").lsp_document_symbols()
                    end, { desc = "Document symbols" }, opts)
                    set("n", "<leader>ds", function()
                        require("telescope.builtin").lsp_dynamic_workspace_symbols()
                    end, { desc = "Worspace symbols" }, opts)
                    set("n", "<leader>ca", function()
                        vim.lsp.buf.code_action()
                    end, { desc = "Code actions" }, opts)
                    set("n", "gr", function()
                        vim.lsp.buf.references()
                    end, opts)
                    set("n", "<leader>ra", function()
                        vim.lsp.buf.rename()
                    end, { desc = "Rename symbol" }, opts)
                    set("n", "<leader>q", function()
                        vim.diagnostic.setloclist()
                    end, { desc = "Show diagnostic loclist" }, opts)
                end,
            })

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = {
                -- clangd = {},
                lua_ls = {},
                -- jdtls = {},
                jsonls = {},
                -- pylsp = {},
                html = {},
                cssls = {},
                -- ts_ls = {},
                angularls = {},
            }

            local ensure_installed = vim.tbl_keys(servers or {})

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })

            require("blink-cmp").setup({
                keymap = { preset = "default" },

                appearance = {
                    nerd_font_variant = "mono",
                },

                completion = {
                    documentation = {
                        window = {
                            border = "rounded",
                        },
                        auto_show = false,
                    },
                    menu = {
                        border = "rounded",
                        draw = {
                            columns = {
                                { "label", "label_description", gap = 1 },
                                { "kind_icon", gap = 1, "kind" },
                            },
                        },
                    },
                },

                sources = {
                    default = {
                        "lsp",
                        "path",
                        "snippets",
                        "buffer",
                    },
                },
            })
        end,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({})
        end,
    },
}
