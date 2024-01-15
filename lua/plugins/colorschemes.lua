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
			})
			vim.ui.border_style = "none"
		end
   },
   {
   	"sainnhe/sonokai",
   },
	{
		"xero/miasma.nvim",
		branch = "dev",
		dependencies = {
			"rktjmp/lush.nvim",
		   "rktjmp/shipwright.nvim",
		},
		lazy = false,
		priority = 1000
	},
	{
		"xiyaowong/transparent.nvim"
	},
}
