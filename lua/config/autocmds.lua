-- Set colorscheme
vim.cmd.colorscheme("oxocarbon")

-- Highlight groups
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#08A045" })
vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#3ddbd9" })

-- User commands
local function sudo_write(args)
	local filename = args.fargs[1]
	if not filename then
		filename = vim.fn.expand("%:p")
		if filename == "" then
			vim.notify("E32: No file name", vim.log.levels.ERROR)
			return
		end
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
		"of=" .. filename,
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

vim.api.nvim_create_user_command("W", sudo_write, { nargs = "*" })

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
vim.api.nvim_create_augroup("HelpMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	callback = function()
		vim.keymap.set("n", "<CR>", "<C-]>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "<BS>", "<C-T>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "o", "/'\\l\\{2,\\}'<CR>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "O", "?'\\l\\{2,\\}'<CR>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "s", "/\\|\\zs\\S\\+\\ze\\|<CR>", { buffer = true, noremap = true, silent = true })
		vim.keymap.set("n", "S", "?\\|\\zs\\S\\+\\ze\\|<CR>", { buffer = true, noremap = true, silent = true })
		vim.wo.colorcolumn = "0"
	end,
	group = "HelpMappings",
})

vim.api.nvim_create_user_command("Grep", function(args)
	local match = args.fargs[1] or ""
	local pattern = args.fargs[2]
	if args.bang then
		pattern = (pattern and pattern ~= "") and pattern or "%"
		vim.cmd(("silent vimgrep /\\v%s/gj %s"):format(match, pattern))
	else
		pattern = pattern or ""
		local escaped_match = vim.fn.shellescape(match)
		vim.cmd(("silent grep! -- %s %s"):format(escaped_match, pattern))
	end
  vim.cmd("copen")
end, {
	nargs = "+",
	bang = true,
	complete = "history",
})

vim.api.nvim_create_user_command("Make", function(args)
	if #args.args > 1 then
		vim.opt.makeprg = args.args
	end
	vim.cmd("make")
end, { nargs = "*", bar = true, complete = "history" })

-- Binary FileType
local function is_binary(path)
	local fd = vim.uv.fs_open(path, "r", 0)
	if not fd then
		return false
	end

	local data = vim.uv.fs_read(fd, 4096, 0)
	vim.uv.fs_close(fd)

	return data ~= nil and data:find("\0", 1, true) ~= nil
end

vim.filetype.add({
	pattern = {
		[".*"] = function(path)
			if is_binary(path) then
				return "bin"
			end
		end,
	},
})

vim.api.nvim_create_augroup("BinaryFileOptions", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "bin",
	callback = function(args)
		local buf = args.buf
		local win = vim.fn.bufwinid(buf)

		vim.bo[buf].swapfile = false
		vim.bo[buf].syntax = ""
		vim.bo[buf].undofile = false

		if win ~= -1 then
			vim.wo[win].wrap = false
			vim.wo[win].spell = false
			vim.wo[win].colorcolumn = ""
			vim.wo[win].cursorline = false
			vim.wo[win].cursorcolumn = false
		end

		vim.treesitter.stop(buf)
		vim.diagnostic.enable(false, { bufnr = buf })
	end,
	group = "BinaryFileOptions",
})

vim.api.nvim_create_user_command("Term", "term", {})
vim.api.nvim_create_user_command("Ters", "sp | term", {})
vim.api.nvim_create_user_command("Terv", "vs | term", {})
vim.cmd([[
  cnoreabbrev <expr> term (getcmdtype() ==# ':' && getcmdline() =~# 'term') ? 'Term' : 'term'
  cnoreabbrev <expr> ters (getcmdtype() ==# ':' && getcmdline() =~# 'ters') ? 'Ters' : 'ters'
  cnoreabbrev <expr> terv (getcmdtype() ==# ':' && getcmdline() =~# 'terv') ? 'Terv' : 'terv'
]])
