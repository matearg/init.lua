-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        local set = vim.keymap.set

        set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        set("n", "K", function() vim.lsp.buf.hover() end, opts)
        set("n", "ff", function() vim.diagnostic.open_float() end, opts)
        set("n", "<C-]>", function() vim.diagnostic.goto_next() end, opts)
        set("n", "<C-[>", function() vim.diagnostic.goto_prev() end, opts)
        set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        set("n", "gr", function() vim.lsp.buf.references() end, opts)
        set("n", "<leader>ra", function() vim.lsp.buf.rename() end, opts)
        set("n", "<leader>q", function() vim.diagnostic.setloclist() end, opts)
        set({ 'n', 'x' }, "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
})

require('mason').setup()
local mason = require('mason-lspconfig')
mason.setup({
    ensure_installed = { 'clangd', 'lua_ls', 'jdtls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

require('blink.cmp').setup({
    keymap = { preset = 'enter' },

    appearance = {
        nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
