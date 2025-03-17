-- Set local variables
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Show diagnostics under the cursor when holding position
augroup("lsp_diagnostics_hold", { clear = true })
autocmd({ "CursorHold" }, {
	pattern = "*.*",
	callback = OpenDiagnosticIfNoFloat,
	group = "lsp_diagnostics_hold",
})

-- Disable folding in certain filetypes
autocmd("FileType", {
	pattern = { "Trouble", "NvimTree", "lazy", "dashboard", "TelescopePrompt", "" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
	end,
})

-- Help pages keybinds
autocmd("FileType", {
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
