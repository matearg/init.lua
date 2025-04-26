require("dropbar").setup({
    keys = {
        vim.keymap.set("n", "<leader>p", function()
            require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
        end),
    },
})
