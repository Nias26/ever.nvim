return {
	"vigoux/notifier.nvim",
	event = "VeryLazy",
	config = function()
		require("notifier").setup({ components = {} })
		require("notifier.config").config.components = { "nvim", "lsp" }
	end,
}
