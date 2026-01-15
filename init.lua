-- init.lua (c) Nias26
vim.loader.enable()

-- [[					Opts					]]
vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
vim.o.timeoutlen = 250
vim.o.updatetime = 250
vim.o.clipboard = "unnamedplus"

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
vim.keymap.set("n", "cz", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "cd", vim.lsp.buf.hover, { desc = "LSP Code Doc" })
vim.keymap.set("n", "cr", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "c]", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to Next Diagnostic" })
vim.keymap.set("n", "c[", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to Previous Diagnostic" })

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
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNR", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

-- [[					Lsp					]]
local capabilities = require('blink.cmp').get_lsp_capabilities()
local on_attach = function(client, _)
	if client:supports_method("textDocument/inlayHint") then
		if client.name ~= "lua_ls" then
			vim.lsp.inlay_hint.enable(true)
		end
	end
end
vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer" })
vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = on_attach,
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
			if vim.tbl_contains(
						vim.lsp.get_clients({ bufnr = 0 })[1].capabilities,
						function(t)
							return vim.deep_equal(t, "formatting")
						end) then
				vim.lsp.buf.format({ async = true })
			end
		end
	end
})

vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*.*",
	callback = function()
		if vim.api.nvim_get_mode().mode ~= "n" then
			return
		end

		-- Check for existing floating windows
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			local conf = vim.api.nvim_win_get_config(winid)
			if conf.relative ~= "" and conf.focusable then
				return
			end
		end

		-- TODO: Change `unpack` with `table.unpack` after deprecation
		local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
		local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })

		if #diagnostics > 0 then
			vim.diagnostic.open_float(nil, {
				scope = "cursor",
				focusable = false,
				close_events = {
					"CursorMoved",
					"CursorMovedI",
					"BufHidden",
					"InsertCharPre",
					"WinLeave",
				},
			})
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.keymap.set("n", "<CR>", "<C-]>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "<BS>", "<C-T>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "o", "/'\\l\\{2,\\}'<CR>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "O", "?'\\l\\{2,\\}'<CR>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "s", "/\\|\\zs\\S\\+\\ze\\|<CR>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "S", "?\\|\\zs\\S\\+\\ze\\|<CR>", { buffer = true, noremap = true, silent = true })
	end,
})

vim.api.nvim_create_user_command("W", function()
	local filepath = vim.fn.expand("%:p")
	if filepath == "" then
		vim.notify("E32: No file name", vim.log.levels.ERROR)
		return
	end

	vim.fn.inputsave()
	local password = vim.fn.inputsecret("󰌆 Password: ")
	vim.fn.inputrestore()

	if not password or #password == 0 then
		vim.notify("Abort: No password provided", vim.log.levels.WARN)
		return
	end

	local tmpfile = vim.fn.tempname()
	local ok_write = pcall(function()
		vim.api.nvim_command("write! " .. vim.fn.fnameescape(tmpfile))
	end)

	if not ok_write then
		vim.notify("Failed to write temporary file", vim.log.levels.ERROR)
		return
	end

	local obj = vim.system({
		"sudo",
		"-S",
		"-p",
		"",
		"dd",
		"if=" .. tmpfile,
		"of=" .. filepath,
		"bs=1M",
	}, {
		stdin = password .. "\n",
		text = true,
	}):wait()

	if obj.code == 0 then
		vim.notify("File written with sudo permissions", vim.log.levels.INFO)
		vim.cmd.checktime()
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	else
		vim.notify("Sudo write failed: " .. (obj.stderr or "Unknown error"), vim.log.levels.ERROR)
	end

	vim.fn.delete(tmpfile)
end, {})
