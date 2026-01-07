return {
	"MagicDuck/grug-far.nvim",
	lazy = true,
	config = function()
		require("grug-far").setup({
			minSearchChars = 1,
			engines = {
				ripgrep = {
					extraArgs = "--pcre2",
				},
			},
		})
	end,
}
