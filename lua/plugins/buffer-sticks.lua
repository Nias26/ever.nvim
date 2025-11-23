return {
	"ahkohd/buffer-sticks.nvim",
	event = "BufEnter",
	config = function()
		require("buffer-sticks").setup({
			filter = {
				filetypes = { "help", "qf", "neo-tree", "Trouble", "dashboard", "TelescopePrompt" },
			},
			highlights = {
				active = { fg = "#bbbbbb" },
				inactive = { fg = "#333333" },
				active_modified = { fg = "#3ddbd9" },
				inactive_modified = { fg = "#999999" },
				label = { fg = "#aaaaaa", italic = true },
			},
		})
		---@diagnostic disable-next-line: undefined-global
		BufferSticks.show()
	end,
}
