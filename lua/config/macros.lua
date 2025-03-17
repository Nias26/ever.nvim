-- Set colorscheme
vim.cmd.colorscheme("oxocarbon")

-- Local variables
local user_cmd = vim.api.nvim_create_user_command

-- Custom Highlight group
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#08A045" })

-- User commands
user_cmd("Q", "bdelete! | Dashboard", {})
user_cmd("D", "Dashboard", {})

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

-- Open LSP Diagnostic window over error, warn, info, ...
-- Check if a floating dialog exists and if not then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
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
