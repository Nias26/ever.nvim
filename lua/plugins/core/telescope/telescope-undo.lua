return {
	"debugloop/telescope-undo.nvim",
	lazy = true,
   dependencies = { "nvim-telescope/telescope.nvim" },
   config = function()
   	require("telescope").load_extension("undo")
   end
}
