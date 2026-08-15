return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		build = false,
		config = function()
			vim.opt.background = "dark"
			vim.schedule(function()
				vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", italic = false })
				for _, s in ipairs({ "Error", "Warn", "Info", "Hint", "Ok" }) do
					local fg = vim.api.nvim_get_hl(0, { name = "Diagnostic" .. s, link = false }).fg
					vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. s, { undercurl = true, sp = fg, fg = "NONE" })
				end
			end)
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
				-- nvim-bqf
				"BqfPreviewBorder",
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
