return {
	"vidocqh/auto-indent.nvim",
	event = "InsertEnter",
	config = function()
		require("auto-indent").setup()
	end
}
