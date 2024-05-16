require("oil").setup({
    columns = { "icon" },
    view_options = { show_hidden = true }
})

local set = vim.keymap.set
set("n", "-", "<CMD>Oil<CR>")
set("n", "<leader>e", "<CMD>Oil<CR>")
