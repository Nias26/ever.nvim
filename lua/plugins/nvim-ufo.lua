return {
	"kevinhwang91/nvim-ufo",
	keys = { "za" },
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.opt.foldcolumn = "1"
		-- vim.o.foldnestmax = 1
		vim.opt.fillchars:append([[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]])
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.g.markdown_folding = 1

		-- Fold Highlightning group
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#525252" })

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
