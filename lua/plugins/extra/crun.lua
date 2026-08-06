return {
	"Nias26/crun.nvim",
	cmd = { "Cc", "Ckill", "Ctoggle" },
	keys = {
		{ "K", "<cmd>Ckill<CR>", desc = "Kill current crun process", ft = "crun" },
		{ "!", ":Cc ", desc = "Exec command on Quickfix" },
		{ "<A-c>", "<cmd>Ctoggle<CR>", desc = "Toggle Crun buffer" },
	},
	opts = {
	},
}
