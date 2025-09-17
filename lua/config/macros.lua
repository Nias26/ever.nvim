-- Set colorscheme
vim.cmd.colorscheme("oxocarbon")

-- Local variables
local user_cmd = vim.api.nvim_create_user_command

-- Custom Highlight group
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#08A045" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", italic = false })

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

local function sudo_exec(cmd, print_output)
	vim.fn.inputsave()
	local password = vim.fn.inputsecret("Password: ")
	vim.fn.inputrestore()
	if not password or #password == 0 then
		vim.notify("Invalid password, sudo aborted", vim.log.levels.WARN)
		return false
	end
	local ok, res = pcall(function()
		return vim.system({ "sh", "-c", string.format("echo '%s' | sudo -p '' -S %s", password, cmd) }):wait()
	end)
	if not ok or res.code ~= 0 then
		print("\r\n")
		vim.notify(not ok and res or res.stderr, vim.log.levels.ERROR)
		return false
	end
	if print_output then
		print("\r\n", res.stderr)
	end
	return true
end

local function sudo_write(tmpfile, filepath)
	if not tmpfile then
		tmpfile = vim.fn.tempname()
	end
	if not filepath then
		filepath = vim.fn.expand("%")
	end
	if not filepath or #filepath == 0 then
		vim.notify("E32: No file name", vim.log.levels.ERROR)
		return
	end
	-- `bs=1048576` is equivalent to `bs=1M` for GNU dd or `bs=1m` for BSD dd
	-- Both `bs=1M` and `bs=1m` are non-POSIX
	local cmd = string.format("dd if=%s of=%s bs=1048576", vim.fn.shellescape(tmpfile), vim.fn.shellescape(filepath))
	-- no need to check error as this fails the entire function
	vim.api.nvim_exec2(string.format("write! %s", tmpfile), { output = true })
	if sudo_exec(cmd) then
		-- refreshes the buffer and prints the "written" message
		vim.cmd.checktime()
		-- exit command mode
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	end
	vim.fn.delete(tmpfile)
end

user_cmd("W", function()
	sudo_write()
end, {})
