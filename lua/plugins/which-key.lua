return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				presets = {
					operators = false,
				},
			},
			icons = {
				group = " ",
			},
			layout = {
				align = "center",
				spacing = 5,
				height = { min = 5, max = 25 },
				width = { min = 20, max = 50 },
			},
		})

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

		-- Index
		wk.register({
			["<leader>"] = {
				t = { "<cmd>tabnew<CR>", "New Tab" },
				d = { "<cmd>tabclose<CR>", "Delete current tab" },
				["["] = { "<cmd>tabprevious<CR>", "Previous tab" },
				["]"] = { "<cmd>tabnext<CR>", "Next tab" },
				M = "which_key_ignore",
				q = { "<cmd>wqa<CR>", "Fast quit" },
				m = { "<cmd>Telescope keymaps<CR>", "Show keymaps" },
			},
		})

		-- Ever.nvim -> 
		wk.register({
			["<leader>e"] = {
				name = " - Ever.nvim",
				c = { "<cmd>cd $HOME/.config/nvim | NvimTreeOpen<CR>", "Edit config" },
				l = { "<cmd>Lazy<CR>", "󰒲 Lazy" },
				g = {
					function()
						vim.ui.open("https://github.com/Nias26/ever.nvim")
					end,
					" Git repo",
				},
				t = { "<cmd>Telescope themes<CR>", "Change theme" },
				b = {
					name = " - Bookmarks",
					["1"] = { "<cmd>e ~/.zshrc<CR>", "~/.zshrc" },
					["2"] = { "<cmd>e ~/.zshenv<CR>", "~/.zshenv" },
					["3"] = { "<cmd>e ~/.config/nvim/init.lua<CR>", "~/.config/nvim/init.lua" },
					["4"] = {},
					["5"] = {},
					["6"] = {},
					["7"] = {},
					["8"] = {},
					["9"] = {},
					["0"] = {},
				},
				v = { "<cmd>TransparentToggle<CR>", "Toggle transparency theme" },
			},
		})

		-- Code -> 
		wk.register({
			["<leader>c"] = {
				name = " - Code",
				t = { "<cmd>TroubleToggle<CR>", "Trouble" },
				g = { "<cmd>GitBlameToggle<CR>", "Toggle git status" },
				l = {
					name = " - LSP",
					d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
					r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
					a = { "<cmd>Lspsaga code_action<CR>", "Code Actions" },
					h = { "<cmd>Lspsaga hover_doc<CR>", "LSP Signature" },
					f = { "<cmd>Lspsaga finder<CR>", "Find References" },
				},
			},
		})

		-- File -> 
		wk.register({
			["<leader>f"] = {
				name = " - File",
				d = { "<cmd>call delete(@%)<CR>", "Delete current file" },
				r = { ":Rename ", "Rename current file" },
				m = { ":Move ", "Move current file" },
				R = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
			},
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
			},
		})

		-- Buffer -> 󰓩
		wk.register({
			["<leader>b"] = {
				name = "󰓩 - Buffer",
				n = { "<cmd>enew<CR>", "New buffer" },
				d = { "<cmd>bdel<CR>", "Delete current buffer" },
				s = {
					name = " Split",
					h = { ":split ", "Horizzontal Split" },
					v = { ":vsplit ", "Vertical Split" },
					c = { "<cmd>q<CR>", "Close current split" },
				},
				["["] = { "<cmd>bprevious<CR>", "Previous buffer" },
				["]"] = { "<cmd>bnext<CR>", "Next buffer" },
			},
		})

		-- Open -> 󰏌
		wk.register({
			["<leader>o"] = {
				name = "󰏌 - Open",
				e = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
				T = { "<cmd>ToggleTerm<CR>", "Toggle term" },
				d = { "<cmd>Dashboard<CR>", "Dashboard" },
				n = { "<cmd>Nerdy<CR>", "Choose Nerd Font Icon" },
				h = { "<cmd>Noice<CR>", "Notification history" },
				t = { "<cmd>Telescope<CR>", "Telescope" },
			},
		})

		-- Help -> 󰋖
		wk.register({
			["<leader>h"] = {
				name = "󰋖 - Help",
				c = { "<cmd>DocsViewToggle<CR>", "View code docs" },
				n = { "<cmd>Telescope help_tags<CR>", "View Neovim docs" },
			},
		})

		-- Neorg -> 󰭃
		wk.register({
			["<leader>n"] = {
				name = "󰭃 - Neorg",
				n = { "<cmd>Neorg<CR>", "Open Neorg menu" },
				w = { "<cmd>Neorg workspace<CR>", "Load Workspace" },
			},
		})
	end,
}
