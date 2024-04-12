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
				file_browser = {},
				scope = {},
			},
		})
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("scope")
	end,
}
