return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.comment").setup({})
			require("mini.pairs").setup({})
			require("mini.git").setup({})
			require("mini.diff").setup({
				view = {
					style = "sign",
					signs = { add = "+", change = "~", delete = "-" },
				},
			})
		end,
	},
}
