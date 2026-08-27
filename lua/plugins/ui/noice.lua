local cmdline_view = {
	relative = "editor",
	position = {
		row = "100%",
		col = 7,
	},
	size = {
		height = "auto",
		width = math.max(20, vim.o.columns - 14),
	},
	border = {
		style = "none",
	},
	win_options = {
		winhighlight = {
			Normal = "NormalFloat",
			FloatBorder = "FloatBorder",
		},
	},
}

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "MunifTanjim/nui.nvim", lazy = true },
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
	},
	keys = {
		{ "<leader>oh", "<cmd>Noice history<CR>", desc = "Notification history" },
	},
	opts = {
		views = {
			popup = cmdline_view,
			cmdline = cmdline_view,
			cmdline_popup = cmdline_view,
			cmdline_input = cmdline_view,
			confirm = cmdline_view,
		},
		cmdline = {
			enabled = true,
			view = "cmdline",
			format = {
				cmdline = { pattern = "^:", icon = ":", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				replace = {
					pattern = { "^:%%s/", "'<,'>s/" },
					icon = "󰑑",
					lang = "regex",
				},
				highlight = { pattern = { "^:hi ", "^:highlight " }, icon = "󰌵", lang = "vim" },
				input = { view = "cmdline" },
			},
		},
		lsp = {
			signature = {
				auto_open = { enabled = false },
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.set_formatting_op"] = true,
			},
		},
		routes = {
			-- Show shell stdout and stderr
			{
				filter = {
					event = "msg_show",
					kind = { "shell_out", "shell_err" },
				},
				opts = {
					replace = true,
					merge = true,
					title = "",
					lang = "bash",
				},
				view = "notify",
			},
			-- Hide shell command notification
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "^:!" },
					},
				},
				opts = { skip = true },
			},
		},
	},
}
