return {
	"pogyomo/submode.nvim",
	lazy = true,
	config = function()
		local submode = require("submode")

		--@diagnostic disable: param-type-mismatch, redundant-parameter
		submode.create("Window", {
			mode = "n",
			enter = "<C-w>",
			leave = { "q", "<ESC>" },
			default = function(register)
				register("<Left>", "<C-w>h")
				register("<Down>", "<C-w>j")
				register("<Up>", "<C-w>k")
				register("<Right>", "<C-w>l")
				register("+", "<C-w>+")
				register("-", "<C-w>-")
				register("<", "<C-w><")
				register(">", "<C-w>>")
				register("=", "<C-w>=")
				register("|", "<C-w>|")
			end,
		})
	end,
}
