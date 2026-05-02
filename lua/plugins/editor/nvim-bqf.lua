return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	dependencies = {
		{
			"junegunn/fzf",
			lazy = true,
			build = function()
				vim.fn["fzf#install"]()
			end,
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
