return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
	config = function()
		require("noice").setup({
			debug = false,
			lsp = {
				progress = {
					enabled = false,
				},
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			cmdline = {
				format = {
					cmdline = {
						pattern = "^:",
						icon = " ",
						lang = "vim",
					},
					search_down = {
						kind = "search",
						pattern = "^/",
						icon = " ",
						lang = "regex",
					},
					search_up = {
						kind = "search",
						pattern = "^%?",
						icon = " ",
						lang = "regex",
					},
					filter = {
						pattern = "^:%s*!",
						icon = "$",
						lang = "bash",
					},
					lua = {
						pattern = "^:%s*lua%s+",
						icon = "",
						lang = "lua",
					},
					help = {
						pattern = "^:%s*h%s+",
						icon = "",
					},
					input = {},
				},
				opts = {
					win_options = {
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = 0,
						col = "50%",
					},
					size = { width = "98%" },
				},
			},
			presets = {
				long_message_to_split = true,
				lsp_doc_border = true,
				inc_rename = true,
			},
			popupmenu = { backend = "cmp" },
			format = {},
			routes = {
				{
					view = "mini",
					filter = { event = "msg_showmode" },
				},
			},
			signature = { enabled = false }
		})
		require("lualine").setup({
			sections = {
				lualine_x = {{
					require("noice").api.statusline.mode.get,
					cond = require("noice").api.statusline.mode.has,
					color = { fg = "#ff9e64" },
				}},
			},
		})
		require("telescope").load_extension("noice")
	end
}
