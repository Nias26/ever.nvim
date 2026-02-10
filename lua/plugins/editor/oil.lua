return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	keys = {
		{ "<leader>oo", "<cmd>Oil<CR>", desc = "Oil" },
	},
	opts = {
		columns = {
			"permissions",
			"size",
			"mtime",
			"icon",
		},
		skip_confirm_for_simple_edits = true,
		constrain_cursor = "name",
		watch_for_changes = true,
		view_options = {
			show_hidden = true,
			case_insensitive = true,
		},
	},
}
