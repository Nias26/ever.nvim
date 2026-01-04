return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		{ "folke/ts-comments.nvim", opts = {} },
	},
	build = ":TSUpdate",
	config = function()
		-- require("nvim-treesitter").install({
		-- 	"c",
		-- 	"lua",
		-- 	"vim",
		-- 	"vimdoc",
		-- 	"query",
		-- 	"markdown",
		-- 	"markdown_inline",
		-- 	"regex",
		-- })

		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
	end,
}
