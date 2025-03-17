return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					hidden = { file_browser = true, folder_browse = true },
					follow_symlinks = true,
					gruped = false,
				},
				scope = {},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
