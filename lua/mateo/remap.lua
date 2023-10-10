vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<S-l>", vim.cmd.bn)
vim.keymap.set("n", "<S-h>", vim.cmd.bp)
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "Q", vim.cmd.bdelete);
vim.keymap.set("n", "<C-w>", vim.cmd.write)
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <cr>")

vim.keymap.set("x", "p", "\"_dP")
