return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.opt.background = "dark" -- set this to dark or light
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				dimInactive = true,
				overrides = function(colors)
					local theme = colors.theme
					local palette = colors.palette

					return {
						--- @highlight Telescope-hl
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

						--- @highlight Line Nubers
						LineNr = { bg = palette.sumiInk3 },
						CursorLineNr = { bg = palette.sumiInk3 },
						--- @highlight Fold Column
						FoldColumn = { bg = palette.sumiInk3 },
						--- @highlight Diagnostics
						SignColumn = { bg = palette.sumiInk3 },
						DiagnosticSignError = { bg = palette.sumiInk3 },
						DiagnosticSignWarn = { bg = palette.sumiInk3 },
						DiagnosticSignHint = { bg = palette.sumiInk3 },
						DiagnosticSignOk = { bg = palette.sumiInk3 },
						DiagnosticSignInfo = { bg = palette.sumiInk3 },
						---@highlight Pmenu
						Pmenu = { fg = "#2a2a37", bg = "#292937" },
						PmenuSel = { bg = "#3f3f48", fg = "NONE" },

						["@variable.builtin"] = { italic = false },
					}
				end,
			})
			vim.ui.border_style = "none"
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
				},
			})
		end,
	},
}
