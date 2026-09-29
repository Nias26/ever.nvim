return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		build = false,
		priority = 1000,
		lazy = false,
		config = function()
			vim.opt.background = "dark"

			vim.schedule(function()
				vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", italic = false })
				for _, s in ipairs({ "Error", "Warn", "Info", "Hint", "Ok", "Unnecessary" }) do
					local fg = vim.api.nvim_get_hl(0, { name = "Diagnostic" .. s, link = false }).fg
					vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. s, { undercurl = true, sp = fg, fg = "NONE" })
				end
			end)

      -- stylua: ignore start
      local palette = {
        bg         = "#161616",
        fg         = "#dde1e6",
        gray       = "#292929",
        green      = "#42be65",
        violet     = "#be95ff",
        red        = "#ee5396",
        cyan       = "#3ddbd9",
        blue       = "#33b1ff",
        light_blue = "#82cfff",
        pink       = "#ff7eb6",
      }
			-- stylua: ignore end

      local hl = vim.api.nvim_set_hl
      hl(0, "OxocarbonBg", { bg = palette.bg })
      hl(0, "OxocarbonFg", { fg = palette.fg })
      hl(0, "OxocarbonGray", { fg = palette.gray })
      hl(0, "OxocarbonGreen", { fg = palette.green })
      hl(0, "OxocarbonViolet", { fg = palette.violet })
      hl(0, "OxocarbonRed", { fg = palette.red })
      hl(0, "OxocarbonCyan", { fg = palette.cyan })
      hl(0, "OxocarbonBlue", { fg = palette.blue })
      hl(0, "OxocarbonLightBlue", { fg = palette.light_blue })
      hl(0, "OxocarbonPink", { fg = palette.pink })
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			overrides = function(colors)
				local theme = colors.theme
				return {
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
				}
			end,
		},
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
