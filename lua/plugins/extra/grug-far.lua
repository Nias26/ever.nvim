return {
	"MagicDuck/grug-far.nvim",
	lazy = true,
	opts = {
		minSearchChars = 1,
		engines = {
			ripgrep = {
				extraArgs = "--pcre2",
			},
		},
	},
}
