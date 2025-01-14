return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		local conform = require("conform")
		conform.setup({
			log_level = vim.log.levels.DEBUG,
			formatters = {
				clang_format = {
					append_args = {
						"--style={BasedOnStyle:LLVM",
						"IndentCaseLabels:true}",
					},
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				go = { "goimports" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
