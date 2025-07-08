require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		html = { "prettierd" },
		c = { "clang-format" },
		java = { "google-java-format" },
        python = { "black" }
	},
})
