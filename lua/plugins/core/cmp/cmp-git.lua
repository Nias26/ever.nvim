return {
	"petertriho/cmp-git",
	event = "BufEnter",
   dependencies = {
   	"nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp"
   },
   config = function()
   	require("cmp_git").setup()
   end
}
