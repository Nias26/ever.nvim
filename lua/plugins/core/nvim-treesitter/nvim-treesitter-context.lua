return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufRead",
	config = function()
		require("treesitter-context").setup()
	end
}
