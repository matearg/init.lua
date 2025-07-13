return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            {
                "saghen/blink.cmp",
                dependencies = { "rafamadriz/friendly-snippets" },
                version = "1.*",
            },
        },
        config = function()
            -- Add borders to floating windows
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

            -- Configure error/warnings interface
            vim.diagnostic.config({
                virtual_text = true,
                severity_sort = true,
                float = {
                    style = "minimal",
                    border = "rounded",
                    header = "",
                    prefix = "",
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
                        vim.lsp.buf.hover()
                    end, opts)
                    set("n", "ff", function()
                        vim.diagnostic.open_float()
                    end, opts)
                    set("n", "<C-]>", function()
                        vim.diagnostic.goto_next()
                    end, opts)
                    set("n", "<C-[>", function()
                        vim.diagnostic.goto_prev()
                    end, opts)
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

            require("mason").setup()
            local mason = require("mason-lspconfig")
            mason.setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "jdtls",
                    "jsonls",
                    "pylsp",
                    "html",
                    "cssls",
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                },
            })

            require("blink-cmp").setup({
                keymap = { preset = "enter" },

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
