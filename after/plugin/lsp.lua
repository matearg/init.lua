local lsp = require("lsp-zero")

lsp.preset("recommended")

require('mason').setup()
local mason = require('mason-lspconfig')
mason.setup({
    ensure_installed = { 'clangd', 'lua_ls' },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Return>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
})

cmp.setup({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
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
    lsp.async_autoformat(client, bufnr)
end)

lsp.setup()
