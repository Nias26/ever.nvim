-- Init.lua file (Main loaded lua file)
-- Check curren neovim version
if vim.fn.has("nvim-0.10") ~= 1 then
	print("Use neovim v0.10 or higher")
	vim.cmd.sleep(2)
	vim.cmd.qa()
end

vim.loader.enable() -- Faster boot time
vim.g.mapleader = " " -- Set leader key
vim.g.maplocalleader = "," -- Set localleader
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.g.showcmdloc = "statusline" -- Show command message location

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
	tabstop = 2, -- Set tabstop
	shiftwidth = 2, -- Set shiftwidth
	expandtab = true, -- Expand tabs into spaces
	autochdir = true, -- Auto change directory
	clipboard = "unnamedplus", -- Sync with system clipboard
	wrap = false, -- Disable line wrap
	grepprg = "rg --vimgrep", -- Use ripgrep instead of grep
	grepformat = "%f:%l:%c:%m", -- Grep formatting
	formatexpr = "v:lua.require'conform'.formatexpr()",
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
	concurrency = 5,
})

require("macros")
require("keybinds")
