return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("markview").setup({
			experimental = {
				check_rtp_message = false,
			},
			preview = {
				modes = { "n", "i", "no", "c" },
				hybrid_modes = { "n", "i" },
				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].concealcursor = "nc"
					end,
				},
			},
		})
	end,
}
