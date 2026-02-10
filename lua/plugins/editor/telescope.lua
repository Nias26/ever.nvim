return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "ibhagwan/fzf-lua", lazy = true },
	},
	keys = {
		{ "<leader>st", "<cmd>Telescope file_browser<CR>", desc = "Find files" },
		{ "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Find text" },
		{ "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
		{ "<leader>sh", "<cmd>Telescope command_history<CR>", desc = "Command history" },
		{ "<leader>ot", "<cmd>Telescope<CR>", desc = "Telescope" },
		{ "<leader>m", "<cmd>Telescope keymaps<CR>", desc = "Show keymaps" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					hidden = { file_browser = true, folder_browse = true },
					follow_symlinks = true,
					gruped = false,
				},
				scope = {},
			},
			pickers = {
				buffers = {
					initial_mode = "normal",
				},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
