return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim", lazy = true },
	opts = {
		keywords = {
			DONE = { icon = " ", color = "success" },
			HERE = { icon = " ", color = "error" },
			TEST = { icon = "⏲ ", color = "test", alt = nil },
			TESTING = { icon = "⏲ ", color = "warning" },
			PASSED = { icon = " ", color = "success" },
			FAILED = { icon = " ", color = "error" },
		},
		colors = {
			success = { "#42be65" },
		},
	},
}
