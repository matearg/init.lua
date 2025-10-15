return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      local builtin = require("telescope.builtin")
      local set = vim.keymap.set
      set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      set("n", "<leader>fo", builtin.oldfiles, { desc = "Find old files" })
      set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
      set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
      set("n", "<leader>fc", function()
        builtin.grep_string({ search = vim.fn.input("Find > ") })
      end, { desc = "Find a word in open project" })
    end,
  },
}
