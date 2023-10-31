return {
	"b0o/incline.nvim",
	event = "WinEnter",
	config = function()
		require("incline").setup()
	end
}
