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
				[".*%.sh"] = "bash",
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

    vim.treesitter.language.register("bash", { "sh", "bash" })

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(opts)
				pcall(vim.treesitter.start, opts.buf)
			end,
		})
	end,
}
