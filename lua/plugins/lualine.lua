return {
	"nvim-lualine/lualine.nvim",
	event = "BufEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")

		-- Color table for highlights
		-- stylua: ignore
		local colors = {
			bg       = '#161616',
			fg       = '#bbc2cf',
      grey     = '#262626',
			green    = '#42be65',
			orange   = '#FF8800',
			violet   = '#be95ff',
      red      = '#ee5396',
      cyan     = '#3ddbd9',
      blue     = '#33b1ff',
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		lualine.setup({
			options = {
				-- Disable sections and component separators
				component_separators = " ",
				section_separators = "",
				theme = "auto",
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},

				lualine_c = {
					{
						-- Mode
						function()
							local mode = vim.api.nvim_get_mode().mode
							local mode_name

							if mode == "n" or mode == "no" then
								mode_name = "RW"
							elseif mode == "i" or mode == "ic" then
								mode_name = "**"
							elseif mode == "v" or mode == "V" or mode == "\022" then
								mode_name = "**"
							elseif mode == "R" then
								mode_name = "RA"
							elseif mode == "c" then
								mode_name = "VIEX"
							elseif mode == "t" then
								mode_name = ""
							end
							return " " .. mode_name .. " "
						end,
						color = function()
							-- auto change color according to neovims mode
							local mode = vim.api.nvim_get_mode().mode

							if mode == "n" or mode == "no" then
								return { bg = "#82cfff", fg = colors.bg, gui = "bold" }
							elseif mode == "i" or mode == "ic" then
								return { bg = "#ff7eb6", fg = colors.bg, gui = "bold" }
							elseif mode == "v" or mode == "V" or mode == "\022" then
								return { bg = "#be95ff", fg = colors.bg, gui = "bold" }
							elseif mode == "R" then
								return { bg = "#3ddbd9", fg = colors.bg, gui = "bold" }
							elseif mode == "c" then
								return { bg = "#42be65", fg = colors.bg, gui = "bold" }
							elseif mode == "t" then
								return { bg = "#33b1ff", fg = colors.bg, gui = "bold" }
							end
						end,
						padding = { rignt = 1 },
					},
					{
						"filename",
						file_status = false,
						symbols = {
							modified = "",
							readonly = "!",
						},
						color = function()
							if vim.bo.readonly then
								return { fg = colors.red }
							else
								return { fg = colors.fg }
							end
						end,
						cond = conditions.buffer_not_empty,
						padding = -1,
					},
					{
						"branch",
						-- "(󰘧  #" .. "branch" .. ")",
						icon = "",
						color = { fg = colors.fg, gui = "bold" },
						cond = conditions.check_git_workspace,
						padding = -1,
					},
					{
						function()
							return vim.api.nvim_get_current_buf()
						end,
						color = { fg = colors.grey },
						padding = -1,
					},
				},
				lualine_x = {
					{
						require("noice").api.status.search.get, ---@diagnostic disable-line: undefined-field
						cond = require("noice").api.status.search.has, ---@diagnostic disable-line: undefined-field
						icon = " ",
						color = { fg = colors.blue },
					},
					{
						require("noice").api.status.mode.get, ---@diagnostic disable-line: undefined-field
						cond = require("noice").api.status.mode.has, ---@diagnostic disable-line: undefined-field
						color = { fg = colors.red },
					},
					{
						require("noice").api.status.command.get, ---@diagnostic disable-line: undefined-field
						cond = require("noice").api.status.command.has, ---@diagnostic disable-line: undefined-field
						icon = "",
						color = { fg = colors.violet },
					},
					{
						"filetype",
						icons_enabled = false,
						color = { fg = colors.cyan },
						padding = -1,
					},
					{
						"location",
						color = { fg = colors.fg },
						padding = -1,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
