return {
	"tamton-aquib/zone.nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("zone").setup()
	end
}
