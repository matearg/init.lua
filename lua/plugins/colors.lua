return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true, -- disables setting the background color.
        float = {
          transparent = true, -- enable transparent floating windows
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
