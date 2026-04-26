return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
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
