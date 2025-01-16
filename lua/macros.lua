-- Set colorscheme
vim.cmd.colorscheme("oxocarbon")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_cmd = vim.api.nvim_create_user_command

-- Set Virtual text
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	seveirty_sort = false,
	float = {
		source = true,
	},
})

-- Close nvim-tree if last buffer
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		if 1 == #wins - #floating_wins - #tree_wins then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(tree_wins) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

-- Open LSP Diagnostic window over error, warn, info, ...
-- Check if a floating dialog exists and if not then check for diagnostics under the cursor
local function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
	-- THIS IS FOR BUILTIN LSP
	---@diagnostic disable-next-line: param-type-mismatch
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

-- Persistent folds
augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = "Persistent Folds",
})
autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = "Persistent Folds",
})

-- Replace command filler
autocmd("CmdlineChanged", {
	pattern = "*",
	callback = function()
		local cmd_type = vim.fn.getcmdtype()
		local cmd_line = vim.fn.getcmdline()

		if cmd_type == ":" and cmd_line == "%s " then
			vim.api.nvim_feedkeys(
				vim.api.nvim_replace_termcodes("<C-u>%s///g<Left><Left><Left>", true, true, true),
				"n",
				false
			)
		end
	end,
})

-- Dashboard Highlight group
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#08A045" })

-- Custom commands
user_cmd("Q", "bdelete! | Dashboard", {})
user_cmd("D", "Dashboard", {})
