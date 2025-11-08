-- Set colorscheme
vim.cmd.colorscheme("oxocarbon")

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*.*",
	-- callback = OpenDiagnosticIfNoFloat,
	callback = function()
		vim.diagnostic.open_float(0, {
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
	end,
	group = "lsp_diagnostics_hold",
})

-- Disable folding in certain filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "Trouble", "NvimTree", "lazy", "dashboard", "TelescopePrompt", "" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
	end,
})

-- Help pages keybinds
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

vim.api.nvim_create_augroup("folds", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
	group = "folds",
	pattern = { "neo-tree" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
	end,
})
