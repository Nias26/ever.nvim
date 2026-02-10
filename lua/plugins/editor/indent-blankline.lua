return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
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
		event = "BufRead",
		version = "*",
		opts = {
			symbol = "|",
		},
	},
}
