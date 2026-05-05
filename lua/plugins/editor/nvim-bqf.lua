return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	dependencies = {
		{
			"junegunn/fzf",
			lazy = true,
		},
	},
	opts = {
		preview = {
			border = "single",
			winblend = 0,
		},
		filter = {
			fzf = {
				extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
			},
		},
	},
}
