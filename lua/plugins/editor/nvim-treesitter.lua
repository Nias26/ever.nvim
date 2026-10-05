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
			pattern = {
				[".*/hypr/.*%.conf"] = "hyprlang",
				[".*"] = {
					function(_, bufnr)
						local line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
						local interpreter = line:match([[^#!.-(%S+)%s*$]])
						interpreter = interpreter and interpreter:match([[([^/]+)$]])
						return interpreter
					end,
					{ priority = -math.huge },
				},
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(ev)
				local ft = vim.bo[ev.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft)
				if vim.treesitter.language.add(lang) then
					vim.treesitter.start(ev.buf, lang)
					vim.bo[ev.buf].syntax = "on"
				end
			end,
		})
	end,
}
