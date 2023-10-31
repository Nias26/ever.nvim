return {
	"LiadOz/nvim-dap-repl-highlights",
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
