vim.loader.enable()

vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "Q", "<cmd>bdel<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Oil" }) 
vim.keymap.set({"n", "v"}, "cc", "gcc", { desc = "Comment line", noremap = true})
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

vim.pack.add({
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "" },
	{ src = "https://github.com/echasnovski/mini.icons" }, -- Oil.nvim dependency
	{ src = "https://github.com/stevearc/oil.nvim" },	
})

require("mini.icons").setup()
require("oil").setup()

vim.cmd.colorscheme("oxocarbon")

vim.lsp.enable("lua_ls", "clangd")
