return {
	"ej-shafran/compile-mode.nvim",
	branch = "latest",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	config = function()
		vim.g.compile_mode = {
			input_word_completion = true,
		}
	end,
}
