return {
	"folke/zen-mode.nvim",
	cmd = { "ZenMode" },
	opts = {
		plugins = {
			options = {
				enabled = true,
				laststatus = 0,
			},
			twilight = { enabled = false },
			gitsigns = { enabled = false },
			tmux = { enabled = true },
		},
		on_open = function()
			vim.notify("Zen mode Activated", vim.log.levels.info)
		end,

		on_close = function()
			vim.notify("Zen mode Deactivated", vim.log.levels.info)
		end,
	},
}
