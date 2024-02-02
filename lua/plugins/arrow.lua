return {
	"otavioschwanck/arrow.nvim",
	event = "VeryLazy",
	config = function()
		require("arrow").setup({
			show_icons = true,
			leaer_key = ";",
			save_path = function()
				return vim.fn.stdpath("data") .. "/arrow"
			end,
		})
	end,
}
