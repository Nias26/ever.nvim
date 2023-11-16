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
f.map({'n', 'v'}, 'cc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', {desc = "Comment line"})
f.map('n', '<A-1>', '<cmd>lua require("dropbar.api").pick()<CR>', {desc = "Dropbar"})
f.map('n', 'ca', '<cmd>lua require("actions-preview").code_actions()<CR>', {desc = "Code Actions"})
f.map('n', 'ct', '<cmd>TroubleToggle<CR>', {desc = "Trouble"})
f.map('n', 'crr', '<cmd>ExecutorRun<CR>', {desc = "Run a command"})
f.map('n', 'crc', '<cmd>ExecutorReset<CR>', {desc = "Reset saved command"})
f.map('n', 'crs', '<cmd>ExecutorToggleDetail<CR>', {desc = "Show command details"})
f.map('n', 'cg', '<cmd>GitBlameToggle<CR>', {desc = "Toggle git status"})

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
		r = { function() vim.ui.input({prompt = 'Rename'}, function(input) f.fcmd('Rename', input)end)end, "Rename current file" },
		m = { function() vim.ui.input({prompt = 'Move'}, function(input) f.fcmd('Move', input)end)end, "Move current file" },
		R = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
		S = {
		    name = "󰏮 - Sudo",
		    w = { "<cmd>SudaWrite<CR>", "Write with [sudo] priviledges" },
		    o = { "<cmd>SudaRead<CR>", "Open with [sudo] priviledges" },
		},
		-- l = { "<cmd>LegendaryScratchToggle<CR>", "Popup Scratch file"},
	}
})
f.map('n', 'fs', '<cmd>source %<CR>', {desc = "Source current file"})
f.map('n', 'fw', '<cmd>wq<CR>', {desc = "Write and quit"})
f.map('n', 'fd', '<cmd>call delete(@%)<CR>', {desc = "Delete current file"})
f.map('n', 'fr', function() vim.ui.input({prompt = 'Rename'}, function(input) f.fcmd('Rename', input)end)end, {desc = "Rename current file"})
f.map('n', 'fm', function() vim.ui.input({prompt = 'Move'}, function(input) f.fcmd('Move', input)end)end, {desc = "Move current file"})
f.map('n', 'fR', '<cmd>lua require("persistence").load({ last = true })<CR>', {desc = "Restore last session"})
f.map('n', 'fSw', '<cmd>SudaWrite<CR>', {desc = "Write with [sudo] priviledges"})
f.map('n', 'fSo', '<cmd>SudaRead<CR>', {desc = "Read with [sudo] priviledges"})
-- f.map('n', 'fl', '<cmd>LegendaryScratchToggle<CR>', {desc = "Popup Scratch file"})
f.map('n', 'ff', 'za')
f.map('n', 'ft', 'zi')

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
f.map({'n', 'v'}, 'st', '<cmd>Telescope<CR>', {desc = "Open Telescope"})
f.map('n', 'sl', '<cmd>LvimFileManager<CR>', {desc = "Open Lvim File manager"})
f.map('n', 'sr', '<cmd>Ranger<CR>', {desc = "Open Ranger"})

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
		-- j = { "<cmd>JABSOpen<CR>", "JABS" },
	}
})
f.map('n', 'bn', function() vim.ui.input({prompt = 'New buffer'}, function(input) f.fcmd('badd', input)end)end, {desc = "New buffer"})
f.map('n', 'bd', '<cmd>bdel<CR>', {desc = "Delete current buffer"})
f.map('n', 'bsh', function() vim.ui.input({prompt = 'Horizzontal split'}, function(input) if input == "" then input = "%" end f.fcmd('split', input) end) end, {desc = "Horizzontal Split"})
f.map('n', 'bsv', function() vim.ui.input({prompt = 'Vertical split'}, function(input) if input == "" then input = "%" end f.fcmd('vsplit', input) end) end, {desc = "Vertical Split"})
f.map('n', '[', '<cmd>bprevious<CR>', {desc = "Previous buffer"})
f.map('n', ']', '<cmd>bnext<CR>', {desc = "Next buffer"})
-- f.map('n', 'bj', '<cmd>JABSOpen<CR>', {desc = "JABS"})
f.map('n', '<Tab>', '<cmd>bnext<CR>')
f.map('n', '<S-Tab>', '<cmd>bprevious<CR>')

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
f.map('n', 'oe', '<cmd>NvimTreeToggle<CR>', {desc = "NvimTree"})
f.map('n', 'om', '<cmd>MinimapToggle<CR>', {desc = "Minimap"})
f.map('n', '<F5>', '<cmd>MinimapToggle<CR>')
f.map('n', 'oT', '<cmd>ToggleTerm<CR>', {desc = "Toggle Term"})
f.map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
f.map('n', 'os', '<cmd>SymbolsOutline<CR>', {desc = "SymbolsOutline"})
f.map('n', 'od', '<cmd>Dashboard<CR>', {desc = "Dashboard"})
f.map('n', 'on', '<cmd>Nerdy<CR>', {desc = "Choose Nerd Font Icon"})
f.map('n', 'oh', '<cmd>Noice<CR>', {desc = "Notification history"})
f.map('n', 'ol', '<cmd>LazyGit<CR>', {desc = "LazyGit"})
f.map('n', 'ot', '<cmd>Telescope<CR>', {desc = "Telescope"})

-- Debug ->  
wk.register({
	["<leader>d"] = {
		name = " - Debug",
		o = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap ui" },
		b = { "<cmd>lua require('dapui').toggle_breakpoint()<CR>", "Set breakpoint" },
	}
})
f.map({'n', 'v'}, 'do', '<cmd>lua require("dapui").toggle()<CR>')
f.map({'n', 'v'}, 'db', '<cmd>lua require("dapui").toggle_breakpoint()<CR>')

-- Help -> 󰋖
wk.register({
	["<leader>h"] = {
		name = "󰋖 - Help",
		c = { "<cmd>DocsViewToggle<CR>", "View code docs" },
		l = { "<cmd>DevdocsOpenCurrentFloat<CR>", "View current language docs" },
		n = { "<cmd>Telescope help_tags<CR>", "View Neovim docs" },
	}
})
f.map({'n', 'v'}, 'hc', '<cmd>DocsViewToggle<CR>')
f.map({'n', 'v'}, 'hl', '<cmd>DevdocsOpenCurrentFloat<CR>')
f.map({'n', 'v'}, 'hn', '<cmd>Telescope help_tags<CR>')

-- Zen -> 󰚀
wk.register({
	["<leader>z"] = {
		name = "󰚀 - Zen",
		f = { "<cmd>TZAtaraxis<CR>", "~ Focus ~" },
		m = { "<cmd>TZMinimalist<CR>", " Minimal " },
		t = { "<cmd>Twilight<CR>", "󰌵 Lights 󰌵" }
	}
})
f.map({'n', 'v'}, 'zf', '<cmd>TZAtaraxis<CR>')
f.map({'n', 'v'}, 'zm', '<cmd>TZMinimalist<CR>')
f.map({'n', 'v'}, 'zl', '<cmd>Twilight<CR>')

-- Neorg -> 󰭃
wk.register({
	["<leader>n"] = {
		name = "󰭃 - Neorg",
		n = { "<cmd>Neorg<CR>", "Open Neorg menu" },
		w = { "<cmd>Neorg workspace<CR>", "Load Workspace"},
	}
})
f.map('n', 'nn', '<cmd>Neorg<CR>')
f.map('n', 'nw', '<cmd>Neorg workspace<CR>')

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

