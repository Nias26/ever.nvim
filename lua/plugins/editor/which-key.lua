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
		})

		wk.add({
			-- Index
			{ "<leader>", group = " Index" },
			{ "<Esc><Esc>", hidden = true },
			-- Ever.nvim -> 
			{ "<leader>e", group = " Ever.nvim" },
			{ "<leader>el", "<cmd>Lazy<CR>", desc = "󰒲 Lazy" },
			{ "<leader>ev", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency theme" },
			-- Code -> 
			{ "<leader>c", group = " Code" },
			{ "<leader>cl", group = " [LSP]" },
			-- Search -> 
			{ "<leader>s", group = " Search" },
			-- Buffer -> 󰓩
			{ "<leader>b", group = "󰓩 Buffer" },
			{ "<leader>bn", "<cmd>enew<CR>", desc = "New buffer" },
			{ "<leader>bd", "<cmd>bdel<CR>", desc = "Delete current buffer" },
			{ "<leader>b[", "<cmd>bprevious<CR>", desc = "Previous buffer" },
			{ "<leader>b]", "<cmd>bnext<CR>", desc = "Next buffer" },
			{ "<leader>bs", group = " Split" },
			{ "<leader>bsh", ":split ", desc = "Horizzontal Split" },
			{ "<leader>bst", ":vsplit ", desc = "Vertical Split" },
			{ "<leader>bsc", "<cmd>q<CR>", desc = "Close current split" },
			-- Open -> 󰏌
			{ "<leader>o", group = "󰏌 Open" },
		})
	end,
}
