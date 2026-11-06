return {
	"chrisgrieser/nvim-origami",
	event = "BufEnter",
	opts = {
		foldText = {
			disableOnFt = { "Trouble", "lazy", "dashboard", "TelescopePrompt", "neo-tree", "markdown", "" },
		},
    foldKeymaps = {
      closeOnlyOnFirstColumn = true
    }
	},
	config = function(_, opts)
		require("origami").setup(opts)
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#525252", bg = "NONE" })
	end,
}
