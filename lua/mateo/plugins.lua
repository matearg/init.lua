local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        }
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    { 'echasnovski/mini.nvim',           version = '*' },
    { 'catppuccin/nvim',                 name = 'catppuccin', priority = 1000 },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
    },
})
