return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = 'v0.6',
	config = function()
		require("ultimate-autopair").setup()
	end
}
