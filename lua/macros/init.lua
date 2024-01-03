-- Set colorscheme
require("current-theme")

Func_status, f = pcall(require, "macros.functions")
if not Func_status then
	return
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
-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	command = "lua f.OpenDiagnosticIfNoFloat()",
	group = "lsp_diagnostics_hold",
})

-- Quit nvim if nvim-tree is the last open buffer
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

-- Format on save
-- vim.api.nvim_create_augroup("LspFormat", { clear = false })
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = "LspFormat",
-- 	buffer = bufnr,
-- 	callback = function()
-- 		-- WARN: Do not replace the vim.api with a variable or it won't work (Thinking about vim.fn.expand() as a fix but not sure for now)
-- 		-- INFO: Need to make this a table and make it better (Thinking of using a for loop for this)
-- 		if vim.api.nvim_buf_get_name(0) == vim.fn.stdpath('config') .. "/init.lua" or vim.api.nvim_buf_get_name(0) == vim.fn.stdpath('config') .. "/lua/keybinds/init.lua" then
-- 			vim.notify("Skipping formatting", vim.log.levels.WARN)
-- 			return
-- 		else
-- 			-- vim.notify("Formatting code", vim.log.levels.INFO) -- You can enable the notification by uncommenting this line
-- 			vim.lsp.buf.format()
-- 		end
-- 	end
-- })
