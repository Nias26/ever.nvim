return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		"andrew-george/telescope-themes",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				themes = {},
				file_browser = {},
				undo = {
					use_delta = true,
					side_by_side = false,
					mappings = {
						i = {
							["<cr>"] = require("telescope-undo.actions").restore,
						},
					},
				},
				scope = {},
				projects = {},
			},
		})
		require("telescope").load_extension("themes")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("scope")
		require("telescope").load_extension("projects")
	end,
}
