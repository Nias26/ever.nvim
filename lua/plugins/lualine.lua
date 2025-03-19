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

							local function _print(mode_id)
								return " " .. mode_id .. " "
							end

							if mode == "n" or mode == "no" or mode == "nt" then
								return _print("RW")
							elseif mode == "i" or mode == "ic" then
								return _print("**")
							elseif mode == "v" or mode == "V" or mode == "\022" then
								return _print("**")
							elseif mode == "R" then
								return _print("RA")
							elseif mode == "c" then
								return _print("VIEX")
							elseif mode == "t" then
								return _print("")
							end
						end,
						color = function()
							-- auto change color according to neovims mode
							local mode = vim.api.nvim_get_mode().mode

							local function _ctable(color)
								return { bg = color, fg = colors.bg, gui = "bold" }
							end

							if mode == "n" or mode == "no" or mode == "nt" then
								return _ctable("#82cfff")
							elseif mode == "i" or mode == "ic" then
								return _ctable("#ff7eb6")
							elseif mode == "v" or mode == "V" or mode == "\022" then
								return _ctable("#be95ff")
							elseif mode == "R" then
								return _ctable("#3ddbd9")
							elseif mode == "c" then
								return _ctable("#42be65")
							elseif mode == "t" then
								return _ctable("#33b1ff")
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
							elseif vim.bo.modified then
								return { fg = colors.cyan }
							else
								return { fg = colors.fg }
							end
						end,
						cond = conditions.buffer_not_empty,
						padding = -1,
					},
					{
						function()
							local branch = vim.api.nvim_buf_get_var(0, "gitsigns_status_dict") or { head = "" }
							local is_head_empty = branch.head ~= ""
							return is_head_empty and string.format("(λ • #%s) ", branch.head) or ""
						end,

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
						padding = -1,
					},
					{
						require("noice").api.status.mode.get, ---@diagnostic disable-line: undefined-field
						cond = require("noice").api.status.mode.has, ---@diagnostic disable-line: undefined-field
						color = { fg = colors.red },
						padding = -1,
					},
					{
						require("noice").api.status.command.get, ---@diagnostic disable-line: undefined-field
						cond = require("noice").api.status.command.has, ---@diagnostic disable-line: undefined-field
						icon = "",
						color = { fg = colors.green },
						padding = -1,
					},
					{
						function()
							local function get_severity(severity)
								return #vim.diagnostic.get(0, { severity = severity })
							end

							local result = get_severity(vim.diagnostic.severity.WARN)
							return result or 0
						end,
						color = { fg = colors.violet },
						padding = -1,
					},
					{
						function()
							local function get_severity(severity)
								return #vim.diagnostic.get(0, { severity = severity })
							end

							local result = get_severity(vim.diagnostic.severity.ERROR)
							return result or 0
						end,
						padding = -1,
						color = { fg = colors.red },
					},
					{
						"filetype",
						icons_enabled = false,
						color = { fg = colors.fg },
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
