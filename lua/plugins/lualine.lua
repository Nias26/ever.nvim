return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"linrongbin16/lsp-progress.nvim",
			config = function()
				require("lsp-progress").setup({
					client_format = function(client_name, spinner, series_messages)
						if #series_messages == 0 then
							return nil
						end
						return {
							name = client_name,
							body = spinner .. " " .. table.concat(series_messages, ", "),
						}
					end,
					format = function(client_messages)
						--- @param name string
						--- @param msg string?
						--- @return string
						local function stringify(name, msg)
							return msg and string.format("%s %s", name, msg) or name
						end

						local sign = ""
						local lsp_clients = vim.lsp.get_active_clients()
						local messages_map = {}
						for _, climsg in ipairs(client_messages) do
							messages_map[climsg.name] = climsg.body
						end

						if #lsp_clients > 0 then
							table.sort(lsp_clients, function(a, b)
								return a.name < b.name
							end)
							local builder = {}
							for _, cli in ipairs(lsp_clients) do
								if
									type(cli) == "table"
									and type(cli.name) == "string"
									and string.len(cli.name) > 0
									then
										if messages_map[cli.name] then
											table.insert(
											builder,
											stringify(cli.name, messages_map[cli.name])
											)
										else
											table.insert(builder, stringify(cli.name))
										end
									end
								end
								if #builder > 0 then
									return sign .. "" .. table.concat(builder, ", ")
								end
							end
							return ""
						end,
					})
			end
		},
	},
	config = function()
		local lualine = require('lualine')

		-- Color table for highlights
		-- stylua: ignore
		local colors = {
			bg       = '#202328',
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
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand('%:p:h')
				local gitdir = vim.fn.finddir('.git', filepath .. ';')
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = '',
				section_separators = '',
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_x = {},
				lualine_y = {},
				-- These will be filled later
				lualine_c = {},
				lualine_z = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_z, component)
		end


		-- Start of lualine components
		ins_left {
			function()
				return '▊'
			end,
			color = { fg = colors.blue }, -- Sets highlighting of component
			padding = { left = 0, right = 1 }, -- We don't need space before this
		}

		ins_left {
			-- mode component
			function()
				return ''
			end,
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.green,
					i = colors.yellow,
					v = colors.blue,
					[''] = colors.blue,
					V = colors.blue,
					c = colors.red,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[''] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					['r?'] = colors.cyan,
					['!'] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1 },
		}

		ins_left {
			-- filesize component
			'filesize',
			cond = conditions.buffer_not_empty,
		}

		ins_left {
			'branch',
			icon = '',
			color = { fg = colors.violet, gui = 'bold' },
			cond = conditions.check_git_workspace
		}

		ins_left {
			'diff',
			symbols = { added = '󰐕 ', modified = '󰏪 ', removed = '󰍴 ' },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.check_git_workspace
		}

		-- Insert mid section. You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
		ins_left {
			function()
				return '%='
			end,
		}

		ins_left {
			'filename',
			cond = conditions.buffer_not_empty,
			color = { fg = colors.magenta, gui = 'bold' },
		}

		ins_left {
			require('lsp-progress').progress,
			icon = ' LSP:',
			color = { fg = '#7cb518', gui = 'bold' },
		}

		ins_left {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ' },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
			},
		}

		-- Add components to right sections

		ins_right {
			'o:encoding', -- option component same as &encoding in viml
			fmt = string.upper, -- I'm not sure why it's upper case either ;)
			color = { fg = colors.green, gui = 'bold' },
		}

		ins_right {
			'fileformat',
			fmt = string.upper,
			icons_enabled = true,
			color = { fg = colors.green, gui = 'bold' },
		}

		ins_right {	'location',	color = { fg = colors.fg, gui = 'bold' } }

		ins_right {
			function()
				local chars = setmetatable({
					" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
					" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
				}, { __index = function() return " " end })
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
				local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
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
			-- color = { fg = colors.magenta, gui = 'bold' }
		}

		ins_right {
			function()
				return '▊'
			end,
			color = { fg = colors.blue },
			padding = { left = 1 },
		}

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end
}
