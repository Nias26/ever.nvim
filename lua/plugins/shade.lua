return {
	"sunjon/shade.nvim",
	event = "WinEnter",
	config = function()
		require("shade").setup({
			overlay_opacity = 50,
			opacity_step = 1,
			keys = {
				brightness_up = nil,
				brightness_down = nil,
				toggle = nil,
			},
		})
	end,
}
