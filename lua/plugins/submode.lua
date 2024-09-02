return {
	"pogyomo/submode.nvim",
	keys = { "<C-w>", "<C-t>" },
	config = function()
		local submode = require("submode")

		submode.create(" Window", {
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

		submode.create("󰓩 Tabs", {
			mode = "n",
			enter = "<C-t>",
			leave = { "q", "<ESC>" },
			default = function(register)
				register("t", "<cmd>tabnew<CR>")
				register("d", "<cmd>tabclose<CR>")
				register("[", "<cmd>tabprevious<CR>")
				register("]", "<cmd>tabnext<CR>")
			end,
		})
	end,
}
