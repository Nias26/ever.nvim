return {
	"glepnir/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "number",
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = " New File",
						group = "@property",
						action = "new",
						key = "n",
					},
					{
						desc = " Search",
						group = "@string",
						action = "Telescope file_browser",
						key = "t",
					},
					{
						desc = " Recent Files",
						group = "Exception",
						action = "Telescope oldfiles",
						key = "p",
					},
					{
						desc = " lazy",
						group = "Number",
						action = "Lazy",
						key = "l",
					},
				},
				project = { enable = false },
				footer = { " ", " ever.nvim " },
			},
		})
	end,
}
