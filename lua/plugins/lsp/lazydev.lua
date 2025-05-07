return {
	"folke/lazydev.nvim",
	lazy = true,
	ft = "lua",
	dependencies = "Bilal2453/luvit-meta",
	opts = {
		library = { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
}
