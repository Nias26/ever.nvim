return {
	"simrat39/symbols-outline.nvim",
	cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
	config = function()
		require("symbols-outline").setup({
			position = "left",
		})
	end,
}
