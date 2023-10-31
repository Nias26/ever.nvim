return {
	"petertriho/cmp-git",
	event = "VeryLazy",
   dependencies = {
   	"nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp"
   },
   config = function()
   	require("cmp_git").setup()
   end
}
