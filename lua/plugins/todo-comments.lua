return {
	"folke/todo-comments.nvim",
	event = "BufRead",
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = {},
   config = function()
   	require("todo-comments").setup({})
   end
}
