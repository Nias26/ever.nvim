-- Init.lua file (Main loaded lua file)

vim.loader.enable() -- Faster boot time
vim.g.mapleader = " " -- Set leader key
vim.g.maplocalleader = "," -- Set localleader

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim setup
require("lazy").setup({
	-- Core Files
	{ import = "plugins" },
	{ import = "plugins.lsp" },
	{ import = "plugins.cmp" },
	-- Lazy.nvim Opts
	ui = {
		icons = {
			cmd = " ",
			config = " ",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			require = "󰢱 ",
			source = " ",
			start = "",
			task = "✔ ",
			list = {
				"●",
				"➜ ",
				"★ ",
				"‒",
			},
		},
	},
	concurrency = 5,
})

require("config")
