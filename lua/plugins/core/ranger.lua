return {
	"kelly-lin/ranger.nvim",
	config = function()
		require("ranger-nvim").setup{
			enable_cmds = true,
		}
	end
}
