return {
	"vigoux/notifier.nvim",
	config = function()
		require("notifier").setup({ components = {} })
		require("notifier.config").config.components = { "nvim", "lsp" }
	end
}
