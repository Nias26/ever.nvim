local wk = require("which-key")

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
		name = " - Ever.nvim",
		c = { "<cmd>cd $HOME/.config/nvim | NvimTreeOpen<CR>", "Edit config" },
		l = { "<cmd>Lazy<CR>", "󰒲 Lazy" },
		g = { function() ui_open('https://github.com/Nias26/ever.nvim') end, " Git repo" },
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
		c = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment line" },
		l = {
			name = "󰈻 - LSP",
			s = { "<cmd>LspStart<CR>", "Start LSP" },
			f = { "<cmd>LspStop<CR>", "Stop LSP" },
			r = { "<cmd>LspRestart<CR>", "Restart LSP" },
			i = { "<cmd>LspInfo<CR>", "Info LSP" },
		},
		d = { "<cmd>lua require('dropbar.api').pick()<CR>", "Dropbar" },
		a = { "<cmd>lua require('actions-preview').code_actions<CR>", "Code Actions" },
		t = { "<cmd>TroubleToggle<CR>", "Trouble" },
		r = {
			name = " - Run",
			r = { "<cmd>ExecutorRun<CR>", "Run a command" },
			c = { "<cmd>ExecutorReset<CR>", "Reset saved command" },
			s = { "<cmd>ExecutorToggleDetail<CR>", "Show command details" },
		},
		g = { "<cmd>GitBlameToggle<CR>", "Toggle git status" },
	}
})
map({'n', 'v'}, 'cc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', {desc = "Comment line"})
map('n', '<A-1>', '<cmd>lua require("dropbar.api").pick()<CR>', {desc = "Dropbar"})
map('n', 'ca', '<cmd>lua require("actions-preview").code_actions()<CR>', {desc = "Code Actions"})
map('n', 'ct', '<cmd>TroubleToggle<CR>', {desc = "Trouble"})
map('n', 'crr', '<cmd>ExecutorRun<CR>', {desc = "Run a command"})
map('n', 'crc', '<cmd>ExecutorReset<CR>', {desc = "Reset saved command"})
map('n', 'crs', '<cmd>ExecutorToggleDetail<CR>', {desc = "Show command details"})
map('n', 'cg', '<cmd>GitBlameToggle<CR>', {desc = "Toggle git status"})

-----
-- ui('input', {prompt = "test"}, function(input) vim.cmd('test', input)end)
-----

-- File -> 
wk.register({
	["<leader>f"] = {
		name = " - File",
		s = { "<cmd>source %<CR>", "Source current file" },
		w = { "<cmd>wq<CR>", "Write and quit" },
		d = { "<cmd>call delete(@%)<CR>", "Delete current file" },
		r = { function() ui_input({prompt = 'Rename'}, function(input) fcmd('Rename', input)end)end, "Rename current file" },
		m = { function() ui_input({prompt = 'Move'}, function(input) fcmd('Move', input)end)end, "Move current file" },
		R = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
		S = {
		    name = "󰏮 - Sudo",
		    w = { "<cmd>SudaWrite<CR>", "Write with [sudo] priviledges" },
		    o = { "<cmd>SudaRead<CR>", "Open with [sudo] priviledges" },
		},
		-- l = { "<cmd>LegendaryScratchToggle<CR>", "Popup Scratch file"},
	}
})
map('n', 'fs', '<cmd>source %<CR>', {desc = "Source current file"})
map('n', 'fw', '<cmd>wq<CR>', {desc = "Write and quit"})
map('n', 'fd', '<cmd>call delete(@%)<CR>', {desc = "Delete current file"})
map('n', 'fr', function() ui_input({prompt = 'Rename'}, function(input) fcmd('Rename', input)end)end, {desc = "Rename current file"})
map('n', 'fm', function() ui_input({prompt = 'Move'}, function(input) fcmd('Move', input)end)end, {desc = "Move current file"})
map('n', 'fR', '<cmd>lua require("persistence").load({ last = true })<CR>', {desc = "Restore last session"})
map('n', 'fSw', '<cmd>SudaWrite<CR>', {desc = "Write with [sudo] priviledges"})
map('n', 'fSo', '<cmd>SudaRead<CR>', {desc = "Read with [sudo] priviledges"})
-- map('n', 'fl', '<cmd>LegendaryScratchToggle<CR>', {desc = "Popup Scratch file"})
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
		l = { "<cmd>LvimFileManager<CR>", "[Lvim] Find files" },
		r = { "<cmd>Ranger<CR>", "Ranger" },
	}
})
map({'n', 'v'}, 'st', '<cmd>Telescope<CR>', {desc = "Open Telescope"})
map('n', 'sl', '<cmd>LvimFileManager<CR>', {desc = "Open Lvim File manager"})
map('n', 'sr', '<cmd>Ranger<CR>', {desc = "Open Ranger"})

-- Buffer -> 󰓩
wk.register({
	["<leader>b"] = {
		name = "󰓩 - Buffer",
		n = { function() ui_input({prompt = 'New buffer'}, function(input) fcmd('badd', input)end)end, "New buffer" },
		d = { "<cmd>bdel<CR>", "Delete current buffer" },
		s = {
			name = " Split",
			h = { function() ui_input({prompt = 'Horizzontal split'}, function(input) if input == "" then input = "%" end fcmd('split', input) end) end, "Horizzontal Split" },
			v = { function() ui_input({prompt = 'Vertical split'}, function(input) if input == "" then input = "%" end fcmd('vsplit', input) end) end, "Vertical Split"},
			c = { "<cmd>q<CR>", "Close current split" },
		},
		["["] = { "<cmd>bprevious<CR>", "Previous buffer" },
		["]"] = { "<cmd>bnext<CR>", "Next buffer" },
		-- j = { "<cmd>JABSOpen<CR>", "JABS" },
	}
})
map('n', 'bn', function() ui_input({prompt = 'New buffer'}, function(input) fcmd('badd', input)end)end, {desc = "New buffer"})
map('n', 'bd', '<cmd>bdel<CR>', {desc = "Delete current buffer"})
map('n', 'bsh', function() ui_input({prompt = 'Horizzontal split'}, function(input) if input == "" then input = "%" end fcmd('split', input) end) end, {desc = "Horizzontal Split"})
map('n', 'bsv', function() ui_input({prompt = 'Vertical split'}, function(input) if input == "" then input = "%" end fcmd('vsplit', input) end) end, {desc = "Vertical Split"})
map('n', '[', '<cmd>bprevious<CR>', {desc = "Previous buffer"})
map('n', ']', '<cmd>bnext<CR>', {desc = "Next buffer"})
-- map('n', 'bj', '<cmd>JABSOpen<CR>', {desc = "JABS"})
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')

-- Open -> 󰏌
wk.register({
	["<leader>o"] = {
		name = "󰏌 - Open",
		e = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
		m = { "<cmd>MinimapToggle<CR>", "Minimap" },
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
map('n', 'om', '<cmd>MinimapToggle<CR>', {desc = "Minimap"})
map('n', '<F5>', '<cmd>MinimapToggle<CR>')
map('n', 'oT', '<cmd>ToggleTerm<CR>', {desc = "Toggle Term"})
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
map('n', 'os', '<cmd>SymbolsOutline<CR>', {desc = "SymbolsOutline"})
map('n', 'od', '<cmd>Dashboard<CR>', {desc = "Dashboard"})
map('n', 'on', '<cmd>Nerdy<CR>', {desc = "Choose Nerd Font Icon"})
map('n', 'oh', '<cmd>Noice<CR>', {desc = "Notification history"})
map('n', 'ol', '<cmd>LazyGit<CR>', {desc = "LazyGit"})
map('n', 'ot', '<cmd>Telescope<CR>', {desc = "Telescope"})

-- Debug ->  
wk.register({
	["<leader>d"] = {
		name = " - Debug",
		o = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap ui" },
		b = { "<cmd>lua require('dapui').toggle_breakpoint()<CR>", "Set breakpoint" },
	}
})
map({'n', 'v'}, 'do', '<cmd>lua require("dapui").toggle()<CR>')
map({'n', 'v'}, 'db', '<cmd>lua require("dapui").toggle_breakpoint()<CR>')

-- Help -> 󰋖
wk.register({
	["<leader>h"] = {
		name = "󰋖 - Help",
		c = { "<cmd>DocsViewToggle<CR>", "View code docs" },
		l = { "<cmd>DevdocsOpenCurrentFloat<CR>", "View current language docs" },
		n = { "<cmd>Telescope help_tags<CR>", "View Neovim docs" },
	}
})
map({'n', 'v'}, 'hc', '<cmd>DocsViewToggle<CR>')
map({'n', 'v'}, 'hl', '<cmd>DevdocsOpenCurrentFloat<CR>')
map({'n', 'v'}, 'hn', '<cmd>Telescope help_tags<CR>')

-- Zen -> 󰚀
wk.register({
	["<leader>z"] = {
		name = "󰚀 - Zen",
		f = { "<cmd>TZAtaraxis<CR>", "~ Focus ~" },
		m = { "<cmd>TZMinimalist<CR>", " Minimal " },
		t = { "<cmd>Twilight<CR>", "󰌵 Lights 󰌵" }
	}
})
map({'n', 'v'}, 'zf', '<cmd>TZAtaraxis<CR>')
map({'n', 'v'}, 'zm', '<cmd>TZMinimalist<CR>')
map({'n', 'v'}, 'zl', '<cmd>Twilight<CR>')

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

-- Legendary setup
-- require('legendary').setup({
--     extensions = {
--         lazy_nvim = {
--             auto_register = true
--         },
--         which_key = {
--             auto_register = true
--         }
--     }
-- })

-- Manual keybinds

