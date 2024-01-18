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
local function tab_win_closed(winnr)
	local api = require"nvim-tree.api"
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else                                                      -- else closed buffer was normal buffer
		if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
				vim.schedule(function ()
					if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
						vim.cmd "quit"                                        -- then close all of vim
					else                                                  -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
					end
				end)
			end
		end
	end
end
vim.api.nvim_create_autocmd("WinClosed", {
	callback = function ()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true
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

-- Dashboard Highlight group
vim.api.nvim_set_hl(0, 'DashboardFooter', {fg='#08A045'})
