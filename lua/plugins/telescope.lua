return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("telescope").setup({
			extensions = {
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
			},
		})
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("scope")
	end,
}
