return {
	"nvim-telescope/telescope-dap.nvim",
	lazy = true,
   dependencies = { "nvim-telescope/telescope.nvim" },
   config = function()
   	require("telescope").load_extension("dap")
   end
}
