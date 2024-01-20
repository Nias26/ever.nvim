return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
	config = function()
		require("noice").setup({
			views = {
				popupmenu = {
					relative = "editor",
					zindex = 65,
					position = "auto", -- when auto, then it will be positioned to the cmdline or cursor
					size = {
						width = "auto",
						height = "auto",
						max_height = 20,
						-- min_width = 10,
					},
					win_options = {
						winbar = "",
						foldenable = false,
						cursorline = true,
						cursorlineopt = "line",
						winhighlight = {
							Normal = "NoicePopupmenu", -- change to NormalFloat to make it look like other floats
							FloatBorder = "NoicePopupmenuBorder", -- border highlight
							CursorLine = "NoicePopupmenuSelected", -- used for highlighting the selected item
							PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
						},
					},
					border = {
						padding = { 0, 1 },
					},
				},
				cmdline_popupmenu = {
					view = "popupmenu",
					zindex = 200,
				},
				virtualtext = {
					backend = "virtualtext",
					format = { "{message}" },
					hl_group = "NoiceVirtualText",
				},
				notify = {
					backend = "notify",
					fallback = "mini",
					format = "notify",
					replace = false,
					merge = false,
				},
				split = {
					backend = "split",
					enter = false,
					relative = "editor",
					position = "bottom",
					size = "20%",
					close = {
						keys = { "q" },
					},
					win_options = {
						winhighlight = { Normal = "NoiceSplit", FloatBorder = "NoiceSplitBorder" },
						wrap = true,
					},
				},
				cmdline_output = {
					format = "details",
					view = "split",
				},
				messages = {
					view = "split",
					enter = true,
				},
				vsplit = {
					view = "split",
					position = "right",
				},
				popup = {
					backend = "popup",
					relative = "editor",
					close = {
						events = { "BufLeave" },
						keys = { "q" },
					},
					enter = true,
					border = {
						style = "rounded",
					},
					position = "50%",
					size = {
						width = "120",
						height = "20",
					},
					win_options = {
						winhighlight = { Normal = "NoicePopup", FloatBorder = "NoicePopupBorder" },
						winbar = "",
						foldenable = false,
					},
				},
				hover = {
					view = "popup",
					relative = "cursor",
					zindex = 45,
					enter = false,
					anchor = "auto",
					size = {
						width = "auto",
						height = "auto",
						max_height = 20,
						max_width = 120,
					},
					border = {
						style = "none",
						padding = { 0, 2 },
					},
					position = { row = 1, col = 0 },
					win_options = {
						wrap = true,
						linebreak = true,
					},
				},
				cmdline = {
					backend = "popup",
					relative = "editor",
					position = {
						row = "100%",
						col = 0,
					},
					size = {
						height = "auto",
						width = "100%",
					},
					border = {
						style = "none",
					},
					win_options = {
						winhighlight = {
							Normal = "NoiceCmdline",
							IncSearch = "",
							CurSearch = "",
							Search = "",
						},
					},
				},
				mini = {
					backend = "mini",
					relative = "editor",
					align = "message-right",
					timeout = 2000,
					reverse = true,
					focusable = false,
					position = {
						row = -1,
						col = "100%",
						-- col = 0,
					},
					size = "auto",
					border = {
						style = "none",
					},
					zindex = 60,
					win_options = {
						winbar = "",
						foldenable = false,
						winblend = 30,
						winhighlight = {
							Normal = "NoiceMini",
							IncSearch = "",
							CurSearch = "",
							Search = "",
						},
					},
				},
				cmdline_popup = {
					backend = "popup",
					relative = "editor",
					focusable = false,
					enter = false,
					zindex = 200,
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
					win_options = {
						winhighlight = {
							Normal = "NoiceCmdlinePopup",
							FloatTitle = "NoiceCmdlinePopupTitle",
							FloatBorder = "NoiceCmdlinePopupBorder",
							IncSearch = "",
							CurSearch = "",
							Search = "",
						},
						winbar = "",
						foldenable = false,
						cursorline = false,
					},
				},
				confirm = {
					backend = "popup",
					relative = "editor",
					focusable = false,
					align = "center",
					enter = false,
					zindex = 210,
					format = { "{confirm}" },
					position = {
						row = "50%",
						col = "50%",
					},
					size = "auto",
					border = {
						style = "rounded",
						padding = { 0, 1 },
						text = {
							top = " Confirm ",
						},
					},
					win_options = {
						winhighlight = {
							Normal = "NoiceConfirm",
							FloatBorder = "NoiceConfirmBorder",
						},
						winbar = "",
						foldenable = false,
					},
				},
			},
			cmdline = {
				enabled = true,
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
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = true, -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
				kind_icons = {},
			},
			command = {
				history = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
				},
				last = {
					view = "popup",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
					filter_opts = { count = 1 },
				},
				-- :Noice errors
				errors = {
					-- options for the message history that you get with `:Noice`
					view = "popup",
					opts = { enter = true, format = "details" },
					filter = { error = true },
					filter_opts = { reverse = true },
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
				hover = {
					enabled = true,
					silent = false, -- set to true to not show a message if hover is not available
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				signature = {
					enabled = false,
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
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "mini",
					opts = {},
				},
				documentation = {
					view = "hover",
					---@type NoiceViewOptions
					opts = {},
				},
			},
			markdown = {
				hover = {
					["|(%S-)|"] = vim.cmd.help, -- vim help links
					["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
				},
				highlights = {
					["|%S-|"] = "@text.reference",
					["@%S+"] = "@parameter",
					["^%s*(Parameters:)"] = "@text.title",
					["^%s*(Return:)"] = "@text.title",
					["^%s*(See also:)"] = "@text.title",
					["{%S-}"] = "@parameter",
				},
			},
			health = {
				checker = true, -- Disable if you don't want health checks to run
			},
			smart_move = {
				-- noice tries to move out of the way of existing floating windows.
				enabled = false, -- you can disable this behaviour here
			},
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = false, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
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
