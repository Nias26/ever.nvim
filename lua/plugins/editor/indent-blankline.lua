return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		name = "ibl",
		opts = {
			exclude = {
				buftypes = {
					"dashboard",
					"lazy",
					"checkhealth",
					"help",
					"man",
					"Terminal",
					"TelescopePrompt",
					"TelescopeResults",
					"mason",
					"qf",
				},
				filetypes = {
					"dashboard",
					"lazy",
					"checkhealth",
					"help",
					"man",
					"Terminal",
					"TelescopePrompt",
					"TelescopeResults",
					"mason",
					"qf",
				},
			},
			indent = {
				highlight = { "Whitespace" },
				char = "|",
				smart_indent_cap = true,
			},
			scope = {
				enabled = true,
				char = "|",
				show_exact_scope = true,
				injected_languages = true,
			},
		},
	},
	{
		"nvim-mini/mini.indentscope",
		event = { "BufReadPost", "BufNewFile" },
		version = "*",
		opts = {
			draw = {
				predicate = function(scope)
					local ft = {
						"dashboard",
						"lazy",
						"checkhealth",
						"help",
						"man",
						"Terminal",
						"TelescopePrompt",
						"TelescopeResults",
						"mason",
						"qf",
					}
					return not scope.body.is_incomplete and not vim.tbl_contains(ft, vim.bo.filetype)
				end,
			},
			symbol = "|",
		},
	},
}
