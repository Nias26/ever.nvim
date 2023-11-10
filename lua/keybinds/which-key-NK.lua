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
		p = { "<cmd>lua require('actions-preview').code_actions<CR>", "Code Actions" },
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
		l = { "<cmd>LegendaryScratchToggle<CR>", "Popup Scratch file"},
	}
})

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

-- Buffer -> 󰓩
wk.register({
	["<leader>b"] = {
		name = "󰓩 - Buffer",
		n = { function() ui_input({prompt = 'New buffer'}, function(input) fcmd('badd', input)end)end, "New buffer" },
		d = { "<cmd>bdel<CR>", "Delete current buffer" },
		s = {
			name = "Super",
			d = { "<cmd>NvimTreeClose | bdel | NvimTreeOpen<CR><C-w>w", "Delete buffer, keep NvimTree" },
		},
		["["] = { "<cmd>bprevious<CR>", "Previous buffer" },
		["]"] = { "<cmd>bnext<CR>", "Next buffer" },
		j = { "<cmd>JABSOpen<CR>", "JABS" },
	}
})

-- Open -> 󰏌
wk.register({
	["<leader>o"] = {
		name = "󰏌 - Open",
		e = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
		m = { "<cmd>MinimapToggle<CR>", "Minimap" },
		t = { "<cmd>ToggleTerm<CR>", "Toggle term" },
		s = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
		d = { "<cmd>Dashboard<CR>", "Dashboard" },
		n = { "<cmd>Nerdy<CR>", "Choose Nerd Font Icon" },
		h = { "<cmd>Noice<CR>", "Notification history" },
		l = { "<cmd>LazyGit<CR>", "LazyGit" },
	}
})

-- Debug ->  
wk.register({
	["<leader>d"] = {
		name = " - Debug",
		o = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap ui" },
		b = { "<cmd>lua require('dapui').toggle_breakpoint()<CR>", "Set breakpoint" },
	}
})

-- Help -> 󰋖
wk.register({
	["<leader>h"] = {
		name = "󰋖 - Help",
		c = { "<cmd>DocsViewToggle<CR>", "View code docs" },
		l = { "<cmd>DevdocsOpenCurrentFloat<CR>", "View current language docs" },
		n = { "<cmd>Telescope help_tags<CR>", "View Neovim docs" },
	}
})

-- Zen -> 󰚀
wk.register({
	["<leader>z"] = {
		name = "󰚀 - Zen",
		f = { "<cmd>TZAtaraxis<CR>", "~ Focus ~" },
		m = { "<cmd>TZMinimalist<CR>", " Minimal " },
		t = { "<cmd>Twilight<CR>", "󰌵 Lights 󰌵" }
	}
})

-- Neorg -> 󰭃
wk.register({
	["<leader>n"] = {
		name = "󰭃 - Neorg",
		n = { "<cmd>Neorg<CR>", "Open Neorg menu" },
		w = { "<cmd>Neorg workspace<CR>", "Load Workspace"},
	}
})

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

