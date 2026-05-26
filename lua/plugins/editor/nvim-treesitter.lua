return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	dependencies = {
		{ "folke/ts-comments.nvim", opts = {} },
	},
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"regex",
		})

		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(opts)
				pcall(vim.treesitter.start, opts.buf)
			end,
		})
	end,
}
