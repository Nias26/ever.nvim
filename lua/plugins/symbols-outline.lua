return {
	"simrat39/symbols-outline.nvim",
	event = "BufReadPre",
   config = function()
   	require("symbols-outline").setup({
			position = "left",
		})
   end
}
