-- Init.lua file (Main loaded lua file)
-- Check curren neovim version
if vim.fn.has("nvim-0.10") ~= 1 then
	print("Use neovim v0.10 or higher")
	vim.cmd("sleep 3")
	vim.cmd("qa")
end

vim.loader.enable() -- vim.loader.enable() # Check neovim wiki for this
vim.g.mapleader = " " -- Set leader key
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.g.showcmdloc = "statusline" -- Show commang message location

local options = {
	relativenumber = true, -- Set Relative Number line
	number = true, -- Set Number line
	inccommand = "split", -- Command preview (eg. `%s/.../...`)
	ignorecase = true, -- Ignore uppercase and lowercase in commands
	laststatus = 3, -- Set global statusbar
	scrolloff = 999, -- Set scrolloff
	updatetime = 300, -- Set updatetime for events
	showmode = false, -- Hide --INSERT-- messages etc...
	splitbelow = true, -- Always split below
	splitright = true, -- Always split right
	undofile = true, -- Enable persistent undo
	cursorline = true, -- Enable cursorline
	termguicolors = true, -- Enable termguicolors
	tabstop = 3, -- Set tabstop
	shiftwidth = 3, -- Set shiftwidth
	autochdir = true, -- Auto change directory
	clipboard = "unnamedplus", -- Sync with system clipboard
	wrap = false, -- Disable line wrap
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

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
})

local status_ok, _ = pcall(require, "macros")
if not status_ok then
	vim.notify("Error loading /lua/macros/init.lua", vim.log.levels.ERROR)
	return
end

local status_ok, _ = pcall(require, "keybinds")
if not status_ok then
	vim.notify("Error loading /lua/keybinds/init.lua", vim.log.levels.ERROR)
	return
end
