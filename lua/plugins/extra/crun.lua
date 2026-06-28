return {
	"Nias26/crun.nvim",
	cmd = { "Cc" },
	keys = {
		{ "K", "<cmd>Ckill<CR>", desc = "Kill current crun process", ft = "crun" },
		{ "!", ":Cc ", desc = "Exec command on Quickfix" },
		{ "<A-c>", "<cmd>Ctoggle<CR>", desc = "Toggle Crun buffer" },
	},
	opts = {
		completion = "path",
		window = {
			position = "bottom",
			height = 15,
			width = 80,
			name = "[Crun]",
		},
	},
}
