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
			cmdline_popup = {
				position = {
					row = 0,
					col = 0,
				},
				size = {
					min_width = 100,
					width = "99%",
					height = "auto",
				},
				border = {
					style = "none",
					padding = { 1, 2 },
				},
			},
		},
		cmdline = {
			enabled = true,
			opts = {
				win_options = {
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
				},
			},
			format = {
				cmdline = { pattern = "^:", icon = " ", lang = "vim" },
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
				input = {},
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.set_formatting_op"] = true,
				["cmp.entry.get_documentation"] = true,
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
