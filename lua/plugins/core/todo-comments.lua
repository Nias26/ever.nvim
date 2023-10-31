return {
	"folke/todo-comments.nvim",
	event = "BufEnter",
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = {},
   config = function()
   	require("todo-comments").setup({})
   end
}
