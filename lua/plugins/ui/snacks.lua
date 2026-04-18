return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		quickfile = { enabled = true },
	},
	config = function()
		vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "NONE" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.scroll.enable()
			end,
		})
	end,
}
