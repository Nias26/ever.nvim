-- set colorscheme
-- vim.cmd("colorscheme oxocarbon")
require("current-theme")
require("macros.functions")


-- Set Number line
vim.opt.relativenumber = true
vim.opt.number = true

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

-- Set global statusbar
vim.opt.laststatus = 3

-- Set scrolloff
vim.opt.scrolloff = 999

-- Typos when writing commands
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})

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

-- Autocmds
-- Start a command In BufEnter, excluding dashboard
local Start = vim.api.nvim_create_augroup('BufInit', { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {group = BufInit , pattern = '*', callback = function()
  if not (vim.bo.filetype == 'dashboard') then
    -- Insert commands in here
  end
end
})
