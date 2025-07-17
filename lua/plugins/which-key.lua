return {
	"folke/which-key.nvim",
	keys = { "<leader>" },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			icons = {
				group = "",
				separator = " ",
				mappings = false,
			},
		})

		-- Index
		wk.add({
			{ "<leader>", group = " Index" },
			{ "<Esc><Esc>", hidden = true },
			{ "<leader>m", "<cmd>Telescope keymaps<CR>", desc = "Show keymaps", icon = "" },
		})

		-- Ever.nvim -> 
		wk.add({
			{ "<leader>e", group = " Ever.nvim" },
			{ "<leader>ec", "<cmd>cd $HOME/.config/nvim | NvimTreeOpen<CR>", desc = "Edit config" },
			{ "<leader>el", "<cmd>Lazy<CR>", desc = "󰒲 Lazy" },
			{
				"<leader>eg",
				function()
					vim.ui.open("https://github.com/Nias26/ever.nvim")
				end,
				desc = " Git repo",
			},
			{ "<leader>ev", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency theme" },
		})

		-- Code -> 
		wk.add({
			{ "<leader>c", group = " Code" },
			{ "<leader>ct", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble" },
			{
				"<leader>cd",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug Adapter Protocol",
			},
			{ "<leader>cb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Git Blame" },
			{ "<leader>cl", group = " [LSP]" },
			{ "<leader>cld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
			{ "<leader>clr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
			{ "<leader>cla", "<cmd>Lspsaga code_action<CR>", desc = "Code Actions" },
			{ "<leader>clh", "<cmd>Lspsaga hover_doc<CR>", desc = "LSP Signature" },
			{ "<leader>clf", "<cmd>Lspsaga finder<CR>", desc = "Find References" },
			{ "<leader>clp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
		})

		-- Search -> 
		wk.add({
			{ "<leader>s", group = " Search" },
			{ "<leader>st", group = " [Telescope]" },
			{ "<leader>stt", "<cmd>Telescope file_browser<CR>", desc = "Find files" },
			{ "<leader>stg", "<cmd>Telescope live_grep<CR>", desc = "Find text" },
			{ "<leader?stb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
			{ "<leader>std", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "<leader>sth", "<cmd>Telescope command_history<CR>", desc = "Command history" },
		})

		-- Buffer -> 󰓩
		wk.add({
			{ "<leader>b", group = "󰓩 Buffer" },
			{ "<leader>bn", "<cmd>enew<CR>", desc = "New buffer" },
			{ "<leader>bd", "<cmd>bdel<CR>", desc = "Delete current buffer" },
			{ "<leader>b[", "<cmd>bprevious<CR>", desc = "Previous buffer" },
			{ "<leader>b]", "<cmd>bnext<CR>", desc = "Next buffer" },
			{ "<leader>bs", group = " Split" },
			{ "<leader>bsh", ":split ", desc = "Horizzontal Split" },
			{ "<leader>bst", ":vsplit ", desc = "Vertical Split" },
			{ "<leader>bsc", "<cmd>q<CR>", desc = "Close current split" },
		})

		-- Tabs -> 󰓪
		wk.add({
			{ "<leader><Tab>", group = "󰓪 Tabs" },
			{ "<leader><Tab>t", "<cmd>tabnew<CR>", desc = "New Tab" },
			{ "<leader><Tab>d", "<cmd>tabclose<CR>", desc = "Delete current tab" },
			{ "<leader><Tab>h", "<cmd>tabprevious<CR>", desc = "Previous tab" },
			{ "<leader><Tab>l", "<cmd>tabnext<CR>", desc = "Next tab" },
		})

		-- Open -> 󰏌
		wk.add({
			{ "<leader>o", group = "󰏌 Open" },
			{ "<leader>os", "<cmd>Neotree document_symbols toggle<CR>", desc = "Document Symbols" },
			{ "<leader>oe", "<cmd>Neotree source=filesystem toggle<CR>", desc = "NeoTree" },
			{ "<leader>od", "<cmd>Dashboard<CR>", desc = "Dashboard" },
			{ "<leader>on", "<cmd>Nerdy<CR>", desc = "Choose Nerd Font Icon" },
			{ "<leader>oh", "<cmd>Noice<CR>", desc = "Notification history" },
			{ "<leader>ot", "<cmd>Telescope<CR>", desc = "Telescope" },
		})

		-- Diffview -> 
		wk.add({
			{ "<leader>d", group = " Diffview" },
			{ "<leader>do", "<cmd>DiffviewOpen<CR>", desc = "Open" },
			{ "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Close" },
			{ "<leader>dr", "<cmd>DiffviewRefresh>CR>", desc = "Refresh" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory<CR>", desc = "File History" },
		})
	end,
}
