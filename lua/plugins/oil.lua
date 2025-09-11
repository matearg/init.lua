return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },   -- use if you prefer nvim-web-devicons
  config = function()
    require("oil").setup({
      columns = { "icon" },
      view_options = { show_hidden = true },
    })

    local set = vim.keymap.set
    set("n", "-", "<CMD>Oil<CR>")
  end,
}
