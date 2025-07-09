require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		html = { "prettierd" },
		css = { "prettierd" },
		json = { "prettierd" },
		c = { "clang-format" },
		java = { "google-java-format" },
		python = { "black" },
		["*"] = { "trim_newlines" },
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
