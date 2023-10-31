return {
	"google/executor.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("executor").setup({
			use_split = false,
		})
	end
}
