return {
	"nvim-telescope/telescope-file-browser.nvim",
	event = "VeryLazy",
   dependencies = { "nvim-telescope/telescope.nvim" },
   config = function()
   	require("telescope").load_extension("file_browser")
   end
}
