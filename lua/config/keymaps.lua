-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
set("i", "jk", "<ESC>")
set("i", "<C-h>", "<Left>")
set("i", "<C-j>", "<Down>")
set("i", "<C-k>", "<Up>")
set("i", "<C-l>", "<Right>")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "Q", vim.cmd.bdelete)
set("n", "<C-c>", "<cmd> %y+ <cr>")
set("x", "p", '"_dP')
