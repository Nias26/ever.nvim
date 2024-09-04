return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("notify").setup({
			background_colour = "#000000",
			render = "compact",
			stages = "static",
			top_down = false,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "none" })
			end,
		})
	end,
}
