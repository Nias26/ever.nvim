return {
	"kevinhwang91/nvim-ufo",
	keys = {
		{ "z", mode = "n" },
	},
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.opt.foldcolumn = "1"
		-- vim.o.foldnestmax = 1
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.g.markdown_folding = 1
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		-- Fold Highlightning group
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#525252" })

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
