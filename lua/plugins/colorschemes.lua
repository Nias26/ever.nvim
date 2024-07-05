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
				commentStyle = { italic = true },
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
					}
				end,
			})
			vim.ui.border_style = "none"
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			-- Bufferline.nvim
			vim.g.transparent_groups = vim.list_extend(
				vim.g.transparent_groups or {},
				vim.tbl_map(function(v)
					return v.hl_group
				end, vim.tbl_values(require("bufferline.config").highlights))
			)

			-- Statuscol
			vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "FoldColumn" })

			-- Trouble
			vim.g.transparent_groups =
				vim.list_extend(vim.g.transparent_groups or {}, { "TroubleNormal", "TroubleNormalNC" })

			-- Lualine.nvim
			require("transparent").clear_prefix("lualine")

			-- Bufferline
			vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "BufferLineDevIcon" })

			-- Window Separator ( Split bar )
			vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "WinSeparator" })

			-- Exclude groups
			require("transparent").setup({
				exclude_groups = {
					"lualine_c_9", -- Lualine component
					"Cmp", -- Cmp
					"Pmenu", -- Cmp
					"PmenuSel", -- Cmp
				},
			})
		end,
	},
}
