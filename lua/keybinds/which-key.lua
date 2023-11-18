local map = vim.keymap.set
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
   return
end

-- Icons Index
-- Ever.nvim -> 
-- Code -> 
-- File -> 
-- Search -> 
-- Buffer -> 󰓩
-- Open -> 󰏌
-- Debug ->  
-- Help -> 󰋖
-- Zen -> 󰚀
-- Neorg -> 󰭃 

wk.register({
	["<leader>"] = {
		["["] = { "<cmd>bprevious<CR>", "Previous buffer" },
		["]"] = { "<cmd>bnext<CR>", "Next buffer" },
		M = 'which_key_ignore',
		q = { "<cmd>wqa<CR>", "Fast quit" },
		m = { "<cmd>Telescope keymaps<CR>", "Show keymaps" },
	}
})


-- Ever.nvim -> 
wk.register({
	["<leader>e"] = {
		name = " - Ever.nvim",
		c = { "<cmd>cd $HOME/.config/nvim | NvimTreeOpen<CR>", "Edit config" },
		l = { "<cmd>Lazy<CR>", "󰒲 Lazy" },
		g = { function() vim.ui.open('https://github.com/Nias26/ever.nvim') end, " Git repo" },
		t = { "<cmd>Telescope themes<CR>", "Change theme" },
		b = {
			name = " - Bookmarks",
			['1'] = { "<cmd>e ~/.zshrc<CR>", "~/.zshrc" },
			['2'] = { "<cmd>e ~/.config/nvim/init.lua<CR>", "~/.config/nvim/init.lua" },
			['3'] = {  },
			['4'] = {  },
			['5'] = {  },
			['6'] = {  },
			['7'] = {  },
			['8'] = {  },
			['9'] = {  },
			['0'] = {  },
		},
		v = { "<cmd>TransparentToggle<CR>", "Toggle transparency theme" },
		u = { "<cmd>!cd $HOME/.config/nvim && git pull<CR>", "Pull updates" },
	}
})


-- Code -> 
wk.register({
	["<leader>c"] = {
		name = " - Code",
		c = { function() require("Comment.api").toggle.linewise() end, "Comment line" },
		d = { "<cmd>lua require('dropbar.api').pick()<CR>", "Dropbar" },
		t = { "<cmd>TroubleToggle<CR>", "Trouble" },
		g = { "<cmd>GitBlameToggle<CR>", "Toggle git status" },
	}
})
map('n', 'cc', function() require("Comment.api").toggle.linewise() end, {desc = "Comment line"})
map('n', '<A-1>', '<cmd>lua require("dropbar.api").pick()<CR>', {desc = "Dropbar"})
map('n', 'ct', '<cmd>TroubleToggle<CR>', {desc = "Trouble"})
map('n', 'cg', '<cmd>GitBlameToggle<CR>', {desc = "Toggle git status"})

-----
-- ui('input', {prompt = "test"}, function(input) vim.cmd('test', input)end)
-----

-- File -> 
wk.register({
	["<leader>f"] = {
		name = " - File",
		d = { "<cmd>call delete(@%)<CR>", "Delete current file" },
		r = { function() vim.ui.input({prompt = 'Rename'}, function(input) f.fcmd('Rename', input)end)end, "Rename current file" },
		m = { function() vim.ui.input({prompt = 'Move'}, function(input) f.fcmd('Move', input)end)end, "Move current file" },
		R = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
	}
})
map('n', 'fd', '<cmd>call delete(@%)<CR>', {desc = "Delete current file"})
map('n', 'fr', function() vim.ui.input({prompt = 'Rename'}, function(input) f.fcmd('Rename', input)end)end, {desc = "Rename current file"})
map('n', 'fm', function() vim.ui.input({prompt = 'Move'}, function(input) f.fcmd('Move', input)end)end, {desc = "Move current file"})
map('n', 'fR', '<cmd>lua require("persistence").load({ last = true })<CR>', {desc = "Restore last session"})
map('n', 'ff', 'za')
map('n', 'ft', 'zi')

-- Search -> 
wk.register({
	["<leader>s"] = {
		name = " - Search",
		t = {
			name = " [Telescope]",
			t = { "<cmd>Telescope file_browser<CR>", "Find files" },
			g = { "<cmd>Telescope live_grep<CR>", "Find text" },
			b = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
			u = { "<cmd>Telescope undo<CR>", "Undo history" },
			d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
			h = { "<cmd>Telescope command_history<CR>", "Command history" },
		},
	}
})
map({'n', 'v'}, 'st', '<cmd>Telescope<CR>', {desc = "Open Telescope"})

-- Buffer -> 󰓩
wk.register({
	["<leader>b"] = {
		name = "󰓩 - Buffer",
		n = { function() vim.ui.input({prompt = 'New buffer'}, function(input) f.fcmd('badd', input)end)end, "New buffer" },
		d = { "<cmd>bdel<CR>", "Delete current buffer" },
		s = {
			name = " Split",
			h = { function() vim.ui.input({prompt = 'Horizzontal split'}, function(input) if input == "" then input = "%" end f.fcmd('split', input) end) end, "Horizzontal Split" },
			v = { function() vim.ui.input({prompt = 'Vertical split'}, function(input) if input == "" then input = "%" end f.fcmd('vsplit', input) end) end, "Vertical Split"},
			c = { "<cmd>q<CR>", "Close current split" },
		},
		["["] = { "<cmd>bprevious<CR>", "Previous buffer" },
		["]"] = { "<cmd>bnext<CR>", "Next buffer" },
	}
})
map('n', 'bn', function() vim.ui.input({prompt = 'New buffer'}, function(input) f.fcmd('badd', input)end)end, {desc = "New buffer"})
map('n', 'bd', '<cmd>bdel<CR>', {desc = "Delete current buffer"})
map('n', 'bsh', function() vim.ui.input({prompt = 'Horizzontal split'}, function(input) if input == "" then input = "%" end f.fcmd('split', input) end) end, {desc = "Horizzontal Split"})
map('n', 'bsv', function() vim.ui.input({prompt = 'Vertical split'}, function(input) if input == "" then input = "%" end f.fcmd('vsplit', input) end) end, {desc = "Vertical Split"})
map('n', '[', '<cmd>bprevious<CR>', {desc = "Previous buffer"})
map('n', ']', '<cmd>bnext<CR>', {desc = "Next buffer"})
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')

-- Open -> 󰏌
wk.register({
	["<leader>o"] = {
		name = "󰏌 - Open",
		e = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
		T = { "<cmd>ToggleTerm<CR>", "Toggle term" },
		s = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
		d = { "<cmd>Dashboard<CR>", "Dashboard" },
		n = { "<cmd>Nerdy<CR>", "Choose Nerd Font Icon" },
		h = { "<cmd>Noice<CR>", "Notification history" },
		l = { "<cmd>LazyGit<CR>", "LazyGit" },
		t = { "<cmd>Telescope<CR>", "Telescope" },
	}
})
map('n', 'oe', '<cmd>NvimTreeToggle<CR>', {desc = "NvimTree"})
map('n', 'oT', '<cmd>ToggleTerm<CR>', {desc = "Toggle Term"})
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
map('n', 'os', '<cmd>SymbolsOutline<CR>', {desc = "SymbolsOutline"})
map('n', 'od', '<cmd>Dashboard<CR>', {desc = "Dashboard"})
map('n', 'on', '<cmd>Nerdy<CR>', {desc = "Choose Nerd Font Icon"})
map('n', 'oh', '<cmd>Noice<CR>', {desc = "Notification history"})
map('n', 'ol', '<cmd>LazyGit<CR>', {desc = "LazyGit"})
map('n', 'ot', '<cmd>Telescope<CR>', {desc = "Telescope"})

-- Debug ->  
if Dap_opt == true then
	wk.register({
		["<leader>d"] = {
			name = " - Debug",
			o = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap ui" },
			b = { "<cmd>lua require('dapui').toggle_breakpoint()<CR>", "Set breakpoint" },
		}
	})
	map({'n', 'v'}, 'do', '<cmd>lua require("dapui").toggle()<CR>')
	map({'n', 'v'}, 'db', '<cmd>lua require("dapui").toggle_breakpoint()<CR>')
else
end

-- Help -> 󰋖
wk.register({
	["<leader>h"] = {
		name = "󰋖 - Help",
		c = { "<cmd>DocsViewToggle<CR>", "View code docs" },
		n = { "<cmd>Telescope help_tags<CR>", "View Neovim docs" },
	}
})
map({'n', 'v'}, 'hc', '<cmd>DocsViewToggle<CR>')
map({'n', 'v'}, 'hn', '<cmd>Telescope help_tags<CR>')

-- Neorg -> 󰭃
wk.register({
	["<leader>n"] = {
		name = "󰭃 - Neorg",
		n = { "<cmd>Neorg<CR>", "Open Neorg menu" },
		w = { "<cmd>Neorg workspace<CR>", "Load Workspace"},
	}
})
map('n', 'nn', '<cmd>Neorg<CR>')
map('n', 'nw', '<cmd>Neorg workspace<CR>')

-- Manual keybinds

