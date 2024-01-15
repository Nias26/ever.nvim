-- Set colorscheme
require("current-theme")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function fcmd(command, opts)
	vim.cmd({ cmd = command, args = {opts}})
end

-- Set Virtual text
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	seveirty_sort = false,
	float = {
		source = "always",
	},
})

-- Open LSP Diagnostic window over error, warn, info, ...
-- Function to check if a floating dialog exists and if not then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
	-- THIS IS FOR BUILTIN LSP
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
end
-- Show diagnostics under the cursor when holding position
augroup("lsp_diagnostics_hold", { clear = true })
autocmd({ "CursorHold" }, {
	pattern = "*",
	command = "lua OpenDiagnosticIfNoFloat()",
	group = "lsp_diagnostics_hold",
})

-- Quit nvim if nvim-tree is the last open buffer
autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= '' then
				table.insert(floating_wins, w)
			end
		end
		if 1 == #wins - #floating_wins - #tree_wins then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(tree_wins) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end
})

-- Typos when writing commands
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})

-- Lsp progress Lualine 
augroup("lualine_augroup", { clear = true })
autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

-- Persistent Folds
local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function() vim.cmd.mkview() end,
	group = save_fold,
})
autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function() vim.cmd.loadview({ mods = { emsg_silent = true } }) end,
	group = save_fold,
})
