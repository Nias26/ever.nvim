require("plugins.core.dap.Dap_opt")

return {
	"LiadOz/nvim-dap-repl-highlights",
	cond = Dap_opt,
	lazy = true,
   dependencies = { "nvim-treesitter/nvim-treesitter" },
   config = function()
   	require('nvim-dap-repl-highlights').setup()
      require('nvim-treesitter.configs').setup {
      	highlight = {
         	enable = true,
         },
         ensure_installed = { 'dap_repl' },
      }
   end
}
