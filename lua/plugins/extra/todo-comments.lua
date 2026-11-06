return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	cmd = "TodoTelescope",
	dependencies = { "nvim-lua/plenary.nvim", lazy = true },
	keys = {
		{ "<A-;>t", "<cmd>TodoTelescope<CR>", desc = "Todos" },
	},
	opts = {
    gui_style = {
      bg = "BOLD",
    },
    highlight = {
      multiline = false,
      keyword = "wide_fg",
      after = ""
    }
	},
}
