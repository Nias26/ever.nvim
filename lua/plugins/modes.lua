-- TODO: replace with naive neovim autocmds
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
		vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesCopyCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesDeleteCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesInsertCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesVisualCursorLineFold", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesCopyCursorLineSign", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesDeleteCursorLineSign", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesInsertCursorLineSign", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "ModesVisualCursorLineSign", { bg = "NONE" })
	end,
}
