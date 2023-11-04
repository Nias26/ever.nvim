-- Init.lua file (Main loaded lua file)
-- Check the current neovim version
-- if vim.fn.has('nvim-0.10') ~= 1 then
	 -- print("Use `nvim-0.10-*`!!! ")
	 -- vim.cmd('2sleep')
	 -- vim.cmd('q!')
-- end

-- vim.loader.enable() # Check neovim wiki for this
vim.loader.enable()

-- Set leader key
vim.g.mapleader = ' '

-- Set Termguicolors
vim.o.termguicolors = true

-- Disable NvimTree at startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tabstop
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

-- Set cursorline
vim.o.cursorline = true

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

-- Disable plugins not available for nvim-0.9.*
-- NOTE: Mabye there's space for improvment
lazy_check = function()
	if vim.fn.has('nvim-0.10') ~= 1 then
		return false
	elseif vim.fn.has('nvim-0.10') == 1 then
		return true
	end
end

-- Lazy.nvim setup
require("lazy").setup({
	-- Core Files
	{ import = "plugins.core" },
	{ import = "plugins.core.nvim-treesitter" },
	{ import = "plugins.core.lsp" },
	{ import = "plugins.core.cmp" },
	{ import = "plugins.core.telescope" },
	{ import = "plugins.core.dap" },
	-- User Files
	{ import = "plugins.user" },
	{ import = "plugins.user.config" },
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
	      }
	   }
   }
})
require("macros")
require("keybinds")
