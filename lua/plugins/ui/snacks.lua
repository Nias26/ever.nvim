return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = {
			enabled = true,
			filter = function(buf)
				return vim.g.snacks_indent ~= false
					and vim.b[buf].snacks_indent ~= false
					and vim.bo[buf].buftype == ""
					and vim.bo[buf].filetype ~= "wk"
					and vim.bo[buf].filetype ~= "TelescopePrompt"
					and vim.bo[buf].filetype ~= "dashboard"
					and vim.bo[buf].filetype ~= "help"
					and vim.bo[buf].filetype ~= "noice"
					and vim.bo[buf].filetype ~= "lazy"
					and vim.bo[buf].filetype ~= "markdown"
			end,
		},
		quickfile = { enabled = true },
		-- TODO: Use the picker
	},
	config = function(_, opts)
		vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "NONE" })

		-- This is stupid anyways
		require("snacks").setup(opts)
	end,
}
