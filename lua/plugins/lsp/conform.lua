return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	opts = {
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
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
			svelte = { "eslint_d" },
			css = { "prettierd" },
			scss = { "prettierd" },
			html = { "prettierd" },
			markdown = { "prettierd" },
			yaml = { "prettierd" },
			["_"] = { "trim_whitespace" },
		},
		format_after_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
