return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre", -- TODO:Add a cond for only git files
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "󰏪" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "" },
				untracked = { text = "|" },
			},
		})
	end,
}
