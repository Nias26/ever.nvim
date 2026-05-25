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
				local lang = vim.treesitter.language.get_lang(opts.match)

				if not lang then
					return
				end

				local installed = ts.get_installed()
				if not vim.tbl_contains(installed, lang) then
					ts.install(lang)
				end

				pcall(vim.treesitter.start, opts.buf)
			end,
		})
	end,
}
