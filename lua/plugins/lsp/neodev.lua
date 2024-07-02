return {
	"folke/lazydev.nvim",
	lazy = true,
	ft = "lua",
	dependencies = "Bilal2453/luvit-meta",
	opts = {
		library = {
			"luvit-meta/library",
		},
	},
	{
		"Bilal2453/luvit-meta",
		lazy = true,
	},
}
