require("plugins.dap.Dap_opt")

return {
	"rcarriga/nvim-dap-ui",
	cond = Dap_opt,
	lazy = true,
   dependencies = {
   	"mfussenegger/nvim-dap",
      "folke/neodev.nvim"
   },
   config = function()
   	require("neodev").setup({
      	library = { plugins = { "nvim-dap-ui" }, types = true }
      })
	   require("dapui").setup()
   end
}
