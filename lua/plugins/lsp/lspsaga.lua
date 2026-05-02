return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	cmd = "Lspsaga",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	keys = {
		{ "cz", "<cmd>Lspsaga code_action<CR>", desc = "Code Actions" },
		{ "cd", "<cmd>Lspsaga hover_doc<CR>", desc = "Code Documentation" },
		{ "gr", "<cmd>Lspsaga finder<CR>", desc = "Find References" },
		{ "[c", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous Diagnostic" },
		{ "]c", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
	},
	opts = {
		diagnostic = {
			show_code_action = true,
			jump_num_shortcut = true,
			diagnostic_only_current = false,
			keys = {
				quit = { "q", "<ESC>" },
			},
		},
		ui = {
			code_action = "󰌵",
			border = "solid",
			expand = "",
			collapse = "",
		},
		symbol_in_winbar = {
			enable = true,
		},
		lightbulb = {
			enable = true,
			sign = false,
		},
		implement = {
			enable = false,
		},
	},
}
