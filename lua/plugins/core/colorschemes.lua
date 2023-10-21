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
        "tiagovla/tokyodark.nvim",
    },
    {
        "polirritmico/monokai-nightasty.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "jacoborus/tender.vim",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "oxfist/night-owl.nvim",
        priority = 1000,
        lazy = false
    },
	{
		"felipeagc/fleet-theme-nvim"
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
	}
}
