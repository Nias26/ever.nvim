return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	name = "ibl",
	opts = {
		exclude = {
			buftypes = {
				"terminal",
				"quickfix",
				"diff",
			},
			filetypes = {
				"dashboard",
				"lazy",
				"checkhealth",
				"help",
				"man",
				"TelescopePrompt",
				"TelescopeResults",
				"mason",
        "oil",
        "oil_preview",
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
}
