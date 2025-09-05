-- init.lua (c) Nias26
vim.loader.enable()

-- [[					Opts					]]
vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- [[					Keymaps					]]
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "Q", "<cmd>bdel<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Oil" })
vim.keymap.set({ "n", "v" }, "cc", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>g", "<cmd>Git<CR>", { desc = "Git" })
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "Go to Reference" })
vim.keymap.set({ "n", "v" }, "cs", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "cf", vim.lsp.buf.format, { desc = "Code Format" })
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "cd", vim.lsp.buf.hover, { desc = "LSP Code Doc" })
vim.keymap.set("n", "cr", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "c]", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to Next Diagnostic" })
vim.keymap.set("n", "c[", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to Previous Diagnostic" })

-- [[					Plugins					]]
vim.pack.add({
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" }, -- Colorscheme
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Syntax Highlightning
	{ src = "https://github.com/neovim/nvim-lspconfig" },           -- Lsp Config
	{ src = "https://github.com/mason-org/mason.nvim" },            -- Lsp Servers
	{ src = "https://github.com/rafamadriz/friendly-snippets" },    -- Snippets
	{ src = "https://github.com/saghen/blink.cmp" },                -- Completion Engine
	{ src = "https://github.com/tpope/vim-fugitive" },              -- Git Integration
	{ src = "https://github.com/echasnovski/mini.icons" },          -- Icons
	{ src = "https://github.com/stevearc/oil.nvim" },               -- File Manager
	{ src = "https://github.com/echasnovski/mini.jump" },           -- Search QoL
	{ src = "https://github.com/romainl/vim-cool" },                -- Search QoL
	{ src = "https://github.com/echasnovski/mini.statusline" },     -- Statusline
})

-- [[					Setup					]]
require("nvim-treesitter").setup()
require("mason").setup()
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<C-n>"] = {
			function(cmp)
				cmp.show({ providers = { "snippets" } })
			end,
		},
		["<Up>"] = { "hide", "fallback" },
		["<Down>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
		["|"] = {
			function(cmp)
				if cmp.is_active() then
					cmp.cancel()
				end
			end,
			"fallback",
		},
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
	},
	fuzzy = { implementation = "lua" },
	sources = {
		default = { "lsp", "snippets", "path", "buffer" },
	},
})
require("mini.icons").setup()
require("mini.jump").setup()
require("mini.statusline").setup()
require("oil").setup()
vim.cmd.colorscheme("oxocarbon")

-- [[					Lsp					]]
local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.enable({ "lua_ls", "clangd" })
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = false })
	end
})
