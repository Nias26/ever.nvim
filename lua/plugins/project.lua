return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			manual_mode = false,
			detection_methods = { "pattern" },
			patterns = { ".git", "Makefile", ".project" },
			show_hidden = false,
			silent_chdir = true,
			scope_chdir = "win",
			datapath = vim.fn.stdpath("data"),
		})
	end,
}
