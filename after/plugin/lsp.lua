-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
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
    set({'n', 'x'}, "<leader>fm", function() vim.lsp.buf.format({async = true}) end, opts)
  end,
})

require('mason').setup()
local mason = require('mason-lspconfig')
mason.setup({
    ensure_installed = { 'clangd', 'lua_ls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

local cmp = require('cmp')
local cmp_mappings = cmp.mapping.preset.insert({
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
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "luasnip" },
    },
    mapping = cmp_mappings,
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    }
})

require("luasnip.loaders.from_vscode").lazy_load()
