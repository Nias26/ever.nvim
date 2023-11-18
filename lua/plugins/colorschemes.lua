return {
	{
   	"nyoom-engineering/oxocarbon.nvim",
      config = function()
      	vim.opt.background = "dark" -- set this to dark or light
      end,
   },
   {
		"rebelot/kanagawa.nvim",
   },
   {
   	"sainnhe/sonokai",
   },
   {
   	"catppuccin/nvim",
   	name = "catppuccin",
      priority = 1000,
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
		"kdheepak/monochrome.nvim"
	},
	{
		"xiyaowong/transparent.nvim"
	},
}
