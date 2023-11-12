return {
	"f-person/git-blame.nvim",
	event = "BufRead",
	config = function()
		require("gitblame").setup{
			enabled = false,
		}
	end
}
