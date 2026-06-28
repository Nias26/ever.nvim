return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<A-;>;", "<cmd>Telescope<CR>", desc = "Telescope" },
		{ "<A-;>G", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
		{ "<A-;>g", "<cmd>Telescope git_files<CR>", desc = "Git Files" },
		{ "<A-;>s", "<cmd>Telescope file_browser<CR>", desc = "File Browser" },
		{ "<A-;>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<A-;>h", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
		{ "<A-;>m", "<cmd>Telescope man_pages sections={'ALL'}<CR>", desc = "Man Pages" },
		{ "<A-;>f", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<A-;>x", "<cmd>Telescope oldfiles<CR>", desc = "Old Files" },
		{ "<A-;>d", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
		{ "<F2>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
	},
	opts = {
		extensions = {
			scope = {},
		},
		pickers = {
			buffers = {
				initial_mode = "normal",
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
}
