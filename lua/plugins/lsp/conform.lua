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
				python = { "black" },
				rust = { "rustfmt" },
				typescript = { "eslint_d", "prettierd" },
				javascript = { "eslint_d", "prettierd" },
				svelte = { "eslint_d", "prettierd" },
				["_"] = { "trim_whitespace" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
