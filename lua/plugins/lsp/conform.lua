return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	keys = {
		{
			mode = { "n", "v" },
			"cf",
			function()
				require("conform").format({
					async = true,
				})
			end,
			desc = "Format code",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		log_level = vim.log.levels.DEBUG,
		formatters = {
			clang_format = {
				append_args = {
					"--style={BasedOnStyle: LLVM, BreakTemplateDeclarations: Yes, AllowShortFunctionsOnASingleLine: None, AllowShortBlocksOnASingleLine: Never, AllowShortIfStatementsOnASingleLine: Always}",
				},
			},
		},
		formatters_by_ft = {
			lua = {
				"stylua",
			},
			cpp = { "clang_format" },
			c = { "clang_format" },
			python = {
				"black",
			},
			rust = { "rustfmt" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			svelte = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			html = { "prettierd" },
			markdown = { "prettierd" },
			yaml = { "prettierd" },
			["_"] = { "trim_whitespace" },
		},
	},
}
