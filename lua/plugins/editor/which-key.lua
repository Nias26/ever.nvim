return {
	"folke/which-key.nvim",
	keys = { "<leader>" },
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			icons = {
				group = "",
				separator = " ",
				mappings = false,
			},
			win = {
				border = "solid",
			},
		})

		wk.add({
			-- Index
			{ "<leader>", group = " Index" },
			{ "<Esc><Esc>", hidden = true },
			-- Ever.nvim -> 
			{ "<leader>e", group = " Ever.nvim" },
			{ "<leader>el", "<cmd>Lazy<CR>", desc = "󰒲 Lazy" },
			{ "<leader>ev", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency theme" },
		})
	end,
}
