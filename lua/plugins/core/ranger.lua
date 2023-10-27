return {
	"kelly-lin/ranger.nvim",
	lazy = true,
	config = function()
		require("ranger-nvim").setup{
			enable_cmds = true,
		}
	end
}
