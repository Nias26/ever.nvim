return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.opt.background = "dark" -- set this to dark or light
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, {
				-- Statusbar
				"FoldColumn",
				"CursorColumn",
				"CursorLineSign",
				-- Trouble
				"TroubleNormal",
				"TroubleNormalNC",
				-- Window Separator
				"WinSeparator",
				-- Folds
				"Folded",
				"UfoFoldedBg",
				-- Winbar
				"WinBar",
				"WinBarNC",
				-- NeoTree
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NeoTreeEndOfBuffer",
				-- Tabline
				"TablineHeader",
				-- Lsp CodeLens
				"LspCodeLens",
			})

			-- Exclude groups
			require("transparent").setup({
				exclude_groups = {
					-- Blink
					"BlinkCmpMenu",
					"BlinkCmpMenuBorder",
					"BlinkCmpMenuSelection",
					"BlinkCmpSignatureHelp",
					"BlinkCmpSignatureHelpBorder",
					"BlinkCmpDoc",
					"BlinkCmpDocBorder",
					"BlinkCmpDoc",
					-- Neovim
					"NormalFloat",
					-- NeoTree
					"NeoTreeFloatNormal",
					-- Tabline
					"TablineActive",
					"TablineInactive",
				},
			})
		end,
	},
}
