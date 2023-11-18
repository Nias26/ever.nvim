require("plugins.dap.Dap_opt")

return {
	"nvim-telescope/telescope-dap.nvim",
	cond = Dap_opt,
	lazy = true,
   dependencies = { "nvim-telescope/telescope.nvim" },
   config = function()
   	require("telescope").load_extension("dap")
   end
}
