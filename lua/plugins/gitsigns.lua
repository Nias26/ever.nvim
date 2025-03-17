return {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
	config = function()
		require("gitsigns").setup({
			signcolumn = false,
		})
	end,
}
