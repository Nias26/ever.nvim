return {
	"mvllow/modes.nvim",
	keys = { "v", "y", "<C-v>", "V", "d", "i", "a", "s", "o", "r", "R" },
	config = function()
		require("modes").setup({
			colors = {
				insert = "#be95ff",
				delete = "#ff7eb6",
				visual = "#82cfff",
				copy = "#42be65",
			},

			set_number = false,
		})
		vim.api.nvim_set_hl(0, "ModesCopyCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesDeleteCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesInsertCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesVisualCursorLineFold", { bg = "NONE" })
	end,
}
