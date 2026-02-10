return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	cmd = "Lspsaga",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	keys = {
		{ "<leader>cld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
		{ "<leader>clr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
		{ "<leader>cla", "<cmd>Lspsaga code_action<CR>", desc = "Code Actions" },
		{ "<leader>clh", "<cmd>Lspsaga hover_doc<CR>", desc = "LSP Signature" },
		{ "<leader>clf", "<cmd>Lspsaga finder<CR>", desc = "Find References" },
		{ "<leader>clp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
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
