-- Init.lua file (Main loaded lua file)
-- Set leader key
vim.g.mapleader = ' '

-- Set Termguicolors
vim.o.termguicolors = true

-- Disable NvimTree at startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tabstop
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

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
    { import = "plugins.core" },
    { import = "plugins.core.nvim-treesitter"},
    { import = "plugins.core.lsp" },
    { import = "plugins.core.cmp"},
    { import = "plugins.core.telescope"},
    { import = "plugins.core.dap" },
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
require("keybinds")
require("macros")
