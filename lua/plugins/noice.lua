return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("noice").setup({
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
					input = {},
				},
			},
			notify = {
				enabled = true,
				view = "mini",
			},
			lsp = {
				progress = {
					format = "lsp_progress",
					format_done = "lsp_progress_done",
					throttle = 1000 / 30, -- frequency to update lsp progress message
					view = "mini",
					enabled = true,
				},
				overrie = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
				},
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "mini",
					opts = {},
				},
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = nil, -- when nil, use defaults from documentation
					---@type NoiceViewOptions
					opts = {}, -- merged with defaults from documentation
				},
			},
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = false, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			routes = {
				{
					view = "mini",
					filter = { event = "msg_showmode" },
				},
			},
		})
		require("telescope").load_extension("noice")
	end,
}
