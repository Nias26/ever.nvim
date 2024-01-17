return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
   dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		"andrew-george/telescope-themes",
		"nvim-telescope/telescope-project.nvim",
		{
			"nvim-telescope/telescope-file-browser.nvim",
			event = "VeryLazy",
		}
	},
   config = function()
		require("telescope").setup({
			extensions = {
				themes = {},
				project = {},
				file_browser = {},
				undo = {
					use_delta = true,
					side_by_side = false,
					mappings = {
						i = {
							["<cr>"] = require("telescope-undo.actions").restore
						}
					}
				},
			}
		})
		require("telescope").load_extension("themes")
		require("telescope").load_extension("project")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("undo")
	end
}
