return {
	"kelly-lin/ranger.nvim",
	event = "VeryLazy",
	config = function()
		require("ranger-nvim").setup{
			enable_cmds = true,
		}
	end
}
