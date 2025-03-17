return {
	"glepnir/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"                                   ",
					"                                   ",
					"                                   ",
					"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
					"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
					"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
					"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
					"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
					"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
					"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
					" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
					" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
					"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
					"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
					"                                   ",
					"                                   ",
					"                                   ",
				},
				center = {
					{
						icon = "  ",
						icon_hl = "Number",
						desc = "New file           ",
						desc_hl = "Number",
						key = "e",
						key_hl = "@string",
						key_format = " %s", -- remove default surrounding `[]`
						action = "ene ",
					},
					{
						icon = "󰈞  ",
						icon_hl = "Number",
						desc = "Find file           ",
						desc_hl = "Number",
						key = "s",
						key_hl = "@string",
						key_format = " %s", -- remove default surrounding `[]`
						action = "Telescope find_files",
					},
					{
						icon = "  ",
						icon_hl = "Number",
						desc = "Recently opened files           ",
						desc_hl = "Number",
						key = "x",
						key_hl = "@string",
						key_format = " %s", -- remove default surrounding `[]`
						action = "Telescope oldfiles",
					},
					{
						icon = "󰊄  ",
						icon_hl = "Number",
						desc = "Find word           ",
						desc_hl = "Number",
						key = "g",
						key_hl = "@string",
						key_format = " %s", -- remove default surrounding `[]`
						action = "Telescope live_grep",
					},
					{
						icon = "󰉋  ",
						icon_hl = "Number",
						desc = "File explorer           ",
						desc_hl = "Number",
						key = "f",
						key_hl = "@string",
						key_format = " %s", -- remove default surrounding `[]`
						action = "Telescope file_browser",
					},
					{
						icon = "󰊢  ",
						icon_hl = "Number",
						desc = "Git files           ",
						desc_hl = "Number",
						key = "g",
						key_hl = "@string",
						key_format = " %s", -- remove default surrounding `[]`
						action = "Telescope git_files",
					},
				},
				footer = { " ", " ever.nvim " },
				vertical_center = true,
			},
		})
	end,
}
