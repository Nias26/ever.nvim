return {
	"google/executor.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("executor").setup({
			 use_split = false,
		})
	end
}
