return {
	"Nias26/crun.nvim",
	enabled = false,
	cmd = { "Cc", "Cnext", "Cprev", "Cqf", "Ckill", "Ctoggle" },
	keys = {
		{ "K", "<cmd>Ckill<CR>", desc = "Kill current crun process", ft = "crun" },
		{ "!", ":Cc ", desc = "Exec command on Quickfix" },
		{ "<A-c>", "<cmd>Ctoggle<CR>", desc = "Toggle Crun buffer" },
	},
	opts = {
		completion = "path",
		timestamps = true,
		color = true,
		errorformat = nil,
		quickfix = {
			enabled = true,
			open = false,
		},
		window = {
			position = "bottom",
			height = 15,
			width = 80,
			name = "[Crun]",
		},
		echo = false,
	},
}
