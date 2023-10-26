local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Example
--wk.register({
--  ["<leader>f"] = {
--    name = "+file",
--    f = { "<cmd>Telescope find_files<cr>", "Find File" },
--    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--    n = { "<cmd>enew<cr>", "New File" },
--  },
--})

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
		g = { "<cmd>lua vim.ui.open('https://github.com/Nias26/ever.nvim')<CR>", " Git repo" },
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
	}
})
map({'n', 'v'}, 'cc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>')
map('n', '<A-1>', '<cmd>lua require("dropbar.api").pick()<CR>')
map('n', 'ca', '<cmd>lua require("actions-preview").code_actions()<CR>')
map('n', 'ct', '<cmd>TroubleToggle<CR>')

-- File -> 
wk.register({
	["<leader>f"] = {
		name = " - File",
		s = { "<cmd>Scratch<CR>", "Create scratch file" },
		w = { "<cmd>wq<CR>", "Write and quit" },
		d = { "<cmd>call delete(@%)<CR>", "Delete current file" },
		r = { ":Rename<Space>", "Rename current file", silent = false },
		m = { ":Move<Space>", "Move current file", silent = false },
		R = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
		S = {
		    name = "󰏮 - Sudo",
		    w = { "<cmd>SudaWrite<CR>", "Write with [sudo] priviledges" },
		    o = { "<cmd>SudaRead<CR>", "Open with [sudo] priviledges" },
		},
		l = { "<cmd>LegendaryScratchToggle", "Popup Scratch file"},
	}
})
map('n', 'fs', '<cmd>Scratch<CR>')
map('n', 'fw', '<cmd>wq<CR>')
map('n', 'fd', '<cmd>call delete(@%)<CR>')
map('n', 'fr', ':Rename<Space>')
map('n', 'fm', ':Move<Space>')
map('n', 'fR', '<cmd>lua require("persistence").load({ last = true })')
map('n', 'fSw', '<cmd>SudaWrite<CR>')
map('n', 'fSo', '<cmd>SudaRead<CR>')
map('n', 'fl', '<cmd>LegendaryScratchToggle<CR>')
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
map({'n', 'v'}, 'st', '<cmd>Telescope<CR>')
map('n', 'sl', '<cmd>LvimFileManager<CR>')
map('n', 'sr', '<cmd>Ranger<CR>')

-- Buffer -> 󰓩
wk.register({
	["<leader>b"] = {
		name = "󰓩 - Buffer",
		c = { ":badd<Space>", "New buffer", silent = false },
		d = { "<cmd>bdel<CR>", "Delete current buffer" },
		s = {
			name = "Super",
			d = { "<cmd>NvimTreeClose | bdel | NvimTreeOpen<CR>", "Delete buffer, keep NvimTree" },
		},
		["["] = { "<cmd>bprevious<CR>", "Previous buffer" },
		["]"] = { "<cmd>bnext<CR>", "Next buffer" },
		j = { "<cmd>JABSOpen<CR>", "JABS" },
	}
})
map('n', 'bc', ':badd<Space>')
map('n', 'bd', '<cmd>bdel<CR>')
map('n', 'bsd', '<cmd>NvimTreeClose | bdel | NvimTreeOpen<CR>')
map('n', '[', '<cmd>bprevious<CR>')
map('n', ']', '<cmd>bnext<CR>')
map('n', 'bj', '<cmd>JABSOpen<CR>')
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')

-- Open -> 󰏌
wk.register({
	["<leader>o"] = {
		name = "󰏌 - Open",
		e = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
		m = { "<cmd>MinimapToggle<CR>", "Minimap" },
		t = { "<cmd>ToggleTerm<CR>", "Toggle term" },
		s = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
		l = { "<cmd>Legendary<CR>", "Legendary" },
		d = { "<cmd>Dashboard<CR>", "Dashboard" },
		n = { "<cmd>Nerdy<CR>", "Choose Nerd Font Icon" },
	}
})
map('n', 'oe', '<cmd>NvimTreeToggle<CR>')
map('n', 'om', '<cmd>MinimapToggle<CR>')
map('n', '<F5>', '<cmd>MinimapToggle<CR>')
map('n', 'ot', '<cmd>ToggleTerm<CR>')
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
map('n', 'ol', '<cmd>Legendary<CR>')
map('n', 'od', '<cmd>Dashboard<CR>')
map('n', 'on', '<cmd>Nerdy<CR>')


-- Debug ->  
wk.register({
	["<leader>d"] = {
		name = " - Debug",
		o = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap ui" },
		b = { "<cmd>lua require('dapui').toggle_breakpoint()<CR>", "Set breakpoint" },
	}
})
map({'n', 'v'}, 'do', '<cmd>lua require("dapui"),toggle()<CR>')
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
	}
})
map({'n', 'v'}, 'zf', '<cmd>TZAtaraxis<CR>')
map({'n', 'v'}, 'zm', '<cmd>TZMinimalist<CR>')

-- Legendary setup
require('legendary').setup({
    extensions = {
        lazy_nvim = {
            auto_register = true
        },
        which_key = {
            auto_register = true
        }
    }
})

-- Manual keybinds

