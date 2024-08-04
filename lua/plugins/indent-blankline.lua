return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	name = "ibl",
	config = function()
		require("ibl").setup({
			exclude = {
				buftypes = {
					"alpha",
					"dashboard",
					"lspinfo",
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
					"alpha",
					"dashboard",
					"lspinfo",
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
		})
	end,
}
