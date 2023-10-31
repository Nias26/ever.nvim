return {
	"f-person/git-blame.nvim",
	event = "BufEnter",
	config = function()
		require("gitblame").setup{
			enabled = false,
		}
	end
}
