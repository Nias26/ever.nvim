return {
	"vigoux/notifier.nvim",
	event = "VeryLazy",
   config = function()
   	require("notifier").setup{}
   end
}
