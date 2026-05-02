return {
	"Nias26/crun.nvim",
	cmd = { "Cc" },
	keys = {
		{ "K", "<cmd>Ckill<CR>", desc = "Kill current crun process", ft = "qf" },
		{ "!", ":Cc ", desc = "Exec command on Quickfix" },
	},
	opts = {
		completiom = "path",
	},
}
