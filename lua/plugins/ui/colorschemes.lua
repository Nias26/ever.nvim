return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		build = false,
		priority = 1000,
		lazy = false,
		config = function()
			vim.opt.background = "dark"

			vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", italic = false })
			local function diagnostic_text_styling()
				local severities = { "Error", "Warn", "Info", "Hint", "Ok", "Unnecessary" }

				for _, s in ipairs(severities) do
					local group_name = "DiagnosticUnderline" .. s
					local target_groups = { group_name }
					if s == "Unnecessary" then
						table.insert(target_groups, "DiagnosticUnnecessary")
					end

					for _, grp in ipairs(target_groups) do
						local hl = vim.api.nvim_get_hl(0, { name = grp, link = false })
						local color = hl.sp or hl.fg

						if color then
							vim.api.nvim_set_hl(0, grp, {
								undercurl = true,
								sp = color,
								fg = nil,
								bg = nil,
								italic = false,
								bold = false,
							})
						end
					end
				end
			end

			vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
				callback = function()
					vim.schedule(function()
						diagnostic_text_styling()

						vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "#5F213C" })
						vim.api.nvim_set_hl(0, "DapStopped", { bg = "#393939" })
						vim.fn.sign_define("DapBreakpoint", { text = "", linehl = "DapBreakpoint" })
						vim.fn.sign_define("DapStopped", { text = "", linehl = "DapStopped" })
            vim.api.nvim_set_hl(0, "Comment", { italic = false, update = true })
					end)
				end,
			})
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
				-- Window Separator
				"WinSeparator",
				-- Folds
				"Folded",
				"UfoFoldedBg",
				-- Winbar
				"WinBar",
				"WinBarNC",
				-- Floating Windows
				"NormalFloat",
				-- NeoTree
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NeoTreeEndOfBuffer",
				-- Lsp CodeLens
				"LspCodeLens",
				-- nvim-bqf
				"BqfPreviewBorder",
				-- Which-key
				"WhichKeyBorder",
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
				},
			})
		end,
	},
}
