return {
	"kevinhwang91/nvim-ufo",
	keys = {
		{ mode = "n", "z" },
	},
	dependencies = { "kevinhwang91/promise-async", lazy = true },
	config = function()
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
		--
		-- Fold Highlightning group
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#525252", bg = "NONE" })

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
