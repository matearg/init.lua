local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local set = vim.keymap.set

set("n", "<leader>a", mark.add_file)
set("n", "<C-e>", ui.toggle_quick_menu)

set("n", "<C-f>", function()
	ui.nav_file(1)
end)
set("n", "<C-s>", function()
	ui.nav_file(2)
end)
set("n", "<C-t>", function()
	ui.nav_file(3)
end)
set("n", "<C-g>", function()
	ui.nav_file(4)
end)
