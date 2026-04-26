return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = {
			enabled = true,
			filter = function(buf, _)
				return vim.bo[buf].filetype ~= "dashboard"
					and vim.bo[buf].filetype ~= "help"
					and vim.bo[buf].filetype ~= "telescope"
			end,
		},
		quickfile = { enabled = true },
	},
	config = function(_, opts)
		vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "NONE" })

		-- This is stupid anyways
		require("snacks").setup(opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.scroll.enable()
			end,
		})
	end,
}
