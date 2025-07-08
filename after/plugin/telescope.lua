local builtin = require("telescope.builtin")
local set = vim.keymap.set
set("n", "<leader>ff", builtin.find_files, {})
set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, {})
set("n", "<leader>fb", builtin.buffers, {})
set("n", "<leader>fo", builtin.oldfiles, {})
set("n", "<leader>fg", builtin.git_files, {})
