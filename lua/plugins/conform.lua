return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				c = { "clang-format" },
				-- java = { "google-java-format" },
				python = { "black" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
