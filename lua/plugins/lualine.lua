return {
	"nvim-lualine/lualine.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")

		-- Color table for highlights
		-- stylua: ignore
		local colors = {
			bg       = '#202328',
			-- bg 		= '#1f1f28', -- For Kanagawa Only
			fg       = '#bbc2cf',
			yellow   = '#ECBE7B',
			cyan     = '#008080',
			darkblue = '#081633',
			green    = '#98be65',
			orange   = '#FF8800',
			violet   = '#a9a1e1',
			magenta  = '#c678dd',
			blue     = '#51afef',
			red      = '#ec5f67',
			gray 		= '#495057',
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

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = " ",
				section_separators = "",
				-- theme = "auto",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},

				lualine_c = {
					{
						-- mode component
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
						"branch",
						icon = "",
						color = { fg = colors.violet, gui = "bold" },
						cond = conditions.check_git_workspace,
					},
					{
						"diff",
						symbols = { added = "󰐕 ", modified = "󰏪 ", removed = "󰍴 " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
						cond = conditions.check_git_workspace,
					},
					{
						"filename",
						cond = conditions.buffer_not_empty,
						color = { fg = colors.gray, gui = "bold" },
					},
					{
						function()
              if #vim.lsp.get_clients() > 1 then
                local lsp_name = vim.lsp.get_clients()[1].name
                for i = 2, #vim.lsp.get_clients() do
                  lsp_name = lsp_name .. " - " .. vim.lsp.get_clients()[i].name
                end
                return lsp_name
              end
              return vim.lsp.get_clients()[1].name
						end,
            icon = " ",
						color = function()
              for i = 1, #vim.lsp.get_clients() do
                if vim.lsp.buf_get_clients(0)[i] == vim.lsp.get_clients()[i] then
                  return { fg = colors.green, gui = "bold" }
                end
              end
              return { fg = colors.gray, gui = "bold" }
            end
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.cyan },
						},
					},
				},
				lualine_x = {
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						icon = " ",
						color = { fg = colors.blue },
					},
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = colors.orange },
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						icon = "",
						color = { fg = colors.orange },
					},
					{
						"filetype",
						-- fmt = string.upper,
						icons_enabled = true,
						color = { fg = colors.green, gui = "bold" },
					},
					{
						"o:encoding", -- option component same as &encoding in viml
						fmt = string.upper, -- I'm not sure why it's upper case either ;
						color = { fg = colors.green, gui = "bold" },
						icon = { "󰘨", color = { fg = colors.red } },
					},
					{
						"location",
						color = { fg = colors.fg, gui = "bold" },
					},
					{
						function()
							local chars = setmetatable({
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
								" ",
							}, {
								__index = function()
									return " "
								end,
							})
							local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
							local position = math.floor(line_ratio * 100)

							local icon = chars[math.floor(line_ratio * #chars)] .. position
							if position <= 5 then
								icon = " TOP"
							elseif position >= 95 then
								icon = " BOT"
							end
							return icon
						end,
						color = function()
							local position =
								math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
							local fg
							local style

							if position <= 5 then
								fg = colors.blue
								style = "bold"
							elseif position >= 95 then
								fg = colors.red
								style = "bold"
							else
								fg = colors.violet
								style = nil
							end
							return {
								fg = fg,
								style = style,
								bg = "bg",
							}
						end,
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
		}

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end,
}
