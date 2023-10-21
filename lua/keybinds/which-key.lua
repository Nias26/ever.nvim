local wk = require("which-key")

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

wk.register({
	["<leader>e"] = {
		name = " - Ever.nvim",
		c = { "<cmd>cd $HOME/.config/nvim | NvimTreeOpen<CR>", "Edit config" },
		l = { "<cmd>Lazy<CR>", "󰒲 Lazy" },
		g = { "<cmd>lua vim.ui.open('https://github.com/Nias26/ever.nvim')<CR>", " Git repo" },
	}
})

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
	}
})

wk.register({
	["<leader>f"] = {
		name = " - File",
		s = { "<cmd>Scratch<CR>", "Create scratch file" },
		w = { "<cmd>wq<CR>", "Write and quit" },
		d = { "<cmd>call delete(@%)<CR>", "Delete current file" },
		r = { ":Rename<Space>", "Rename current file", silent = false },
		m = { ":Move<Space>", "Move current file", silent = false },
		R = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
	}
})

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

wk.register({
	["<leader>d"] = {
		name = " - Debug",
		o = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap ui" },
		b = { "<cmd>lua require('dapui').toggle_breakpoint()<CR>", "Set breakpoint" },
	}
})

wk.register({
	["<leader>h"] = {
		name = "󰋖 - Help",
		v = { "<cmd>DocsViewToggle<CR>", "View code docs" },
		d = { "<cmd>DevdocsOpenCurrentFloat<CR>", "View current language docs" },
		n = { "<cmd>Telescope help_tags<CR>", "View Neovim docs" },
	}
})

wk.register({
	["<leader>z"] = {
		name = "󰚀 - Zen",
		f = { "<cmd>TZAtaraxis<CR>", "~ Focus ~" },
		m = { "<cmd>TZMinimalist<CR>", " Minimal " },
	}
})

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
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
--    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	  vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<F5>', '<cmd>MinimapToggle<CR>')
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
map('n', 'fo', '<cmd>foldopen<CR>')
map('n', 'fc', '<cmd>foldclose<CR>')
map('n', 'ff', 'za')
map('n', 'ft', 'zi')
map('n', '<A-1>', '<cmd>lua require("dropbar.api").pick()<CR>')

