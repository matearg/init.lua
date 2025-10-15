local set = vim.keymap.set

vim.g.mapleader = " "
vim.g.localmapleader = " "

set("i", "jk", "<ESC>")
set("i", "<C-h>", "<Left>")
set("i", "<C-j>", "<Down>")
set("i", "<C-k>", "<Up>")
set("i", "<C-l>", "<Right>")

-- set("n", "-", vim.cmd.Ex)
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("n", "<S-l>", vim.cmd.bn)
set("n", "<S-h>", vim.cmd.bp)
-- set("n", "<C-h>", "<C-w>h")
-- set("n", "<C-j>", "<C-w>j")
-- set("n", "<C-k>", "<C-w>k")
-- set("n", "<C-l>", "<C-w>l")
set("n", "Q", vim.cmd.bdelete)
-- set("n", "<C-w>", vim.cmd.write)
set("n", "<C-c>", "<cmd> %y+ <cr>")

set("x", "p", '"_dP')
