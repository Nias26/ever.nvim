-- Set colorscheme
vim.cmd.colorscheme("oxocarbon")

-- Highlight groups
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#08A045" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", italic = false })

-- User commands
local function sudo_write()
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
end

vim.api.nvim_create_user_command("W", sudo_write, {})
-- TODO: Make it asyncronous and output lines as we collect them
vim.api.nvim_create_user_command("Crun", function(opts)
	if not _G._crun_saved then
		_G._crun_saved = {
			last_args = nil,
			oldargs = {},
		}
	end

	if opts.args ~= "" then
		local old = _G._crun_saved.oldargs

		if not vim.tbl_contains(old, opts.args) then
			local max = 20
			if #old >= max then
				table.remove(old, 1)
			end
			table.insert(old, opts.args)
		end

		_G._crun_saved.last_args = opts.args
	else
		opts.args = _G._crun_saved.last_args
	end

	if not opts.args or opts.args == "" then
		print("No command to execute")
		return
	end

	local obj = vim.system(vim.split(opts.args, " "), { text = true }):wait()

	local output = obj.stdout .. obj.stderr
	output = vim.trim(output)

	if output == "" then
		return
	end

	local lines = vim.split(output, "\n")

	local qf_items = {}
	for _, line in ipairs(lines) do
		table.insert(qf_items, { text = line })
	end

	vim.fn.setqflist({}, "r", {
		title = "Output: " .. opts.args,
		items = qf_items,
	})

	vim.cmd("copen")
end, {
	nargs = "*",
	complete = function()
		if not _G._crun_saved then
			return {}
		end
		return vim.iter(_G._crun_saved.oldargs):rev():totable()
	end,
})

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
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

		-- TODO: Use `table.unpack` instead of `unpack` after deprecation
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
	group = "lsp_diagnostics_hold",
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

-- Quickfix keybinds
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		local opts = { noremap = true, silent = true, buffer = true }
		vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>", opts)
		vim.keymap.set("n", "<C-p>", "<cmd>cprevious<CR>", opts)
	end,
})
