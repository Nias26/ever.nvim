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
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = false,
			},
		})
	end,
}
