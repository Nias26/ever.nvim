return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"saifulapm/neotree-file-nesting-config",
	},
	config = function()
		local nesting_rules = require("neotree-file-nesting-config").nesting_rules
		require("neo-tree").setup({
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			close_if_last_window = true,
			popup_border_style = "solid",
			enable_cursor_hijack = true,
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
				},
				git_status = {
					symbols = {
						added = "",
						deleted = "-",
						modified = "",
						renamed = "󰏪",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				mappings = {
					["<Space>"] = { "toggle_node", nowait = true },
					["<CR>"] = { "open", config = { expand_nested_files = true } }, -- expand nested file takes precedence
					["<Tab>"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
					["<C-s>"] = "open_split",
					["<C-v>"] = "open_vsplit",
					[","] = "navigate_up",
					["."] = "set_root",
					["l"] = "open",
					["h"] = "close_node",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				hijack_netrw_behavior = "open_current",
				bind_to_cwd = false,
			},
			document_symbols = {
				follow_cursor = true,
			},
			nesting_rules = nesting_rules,
		})
	end,
}
