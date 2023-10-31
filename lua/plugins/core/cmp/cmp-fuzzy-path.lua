return {
	"tzachar/cmp-fuzzy-path",
	event = "VeryLazy",
   dependencies = {
   	{
      	"nvim-telescope/telescope-fzf-native.nvim",
         build = 'make'
      },
      "hrsh7th/nvim-cmp",
      "tzachar/fuzzy.nvim"
   }
}
