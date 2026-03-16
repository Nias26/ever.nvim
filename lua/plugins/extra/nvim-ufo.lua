return {
	"kevinhwang91/nvim-ufo",
	keys = {
		{ mode = "n", "z" },
	},
	dependencies = { "kevinhwang91/promise-async", lazy = true },
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
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})

		-- Disable folding in certain filetypes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "Trouble", "lazy", "dashboard", "TelescopePrompt", "neo-tree", "" },
			callback = function()
				require("ufo").detach()
				vim.opt_local.foldenable = false
			end,
		})
	end,
}
