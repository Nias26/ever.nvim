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
			-- bg       = '#202328',
			bg 		= '#1f1f28', -- For Kanagawa Only
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
				component_separators = "",
				section_separators = "",
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

		ins_left({
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
				return " " .. mode_name
			end,
			color = function()
				-- auto change color according to neovims mode
				local mode = vim.api.nvim_get_mode().mode

				if mode == "n" or mode == "no" then
					return { bg = "#82cfff", fg = colors.bg }
				elseif mode == "i" or mode == "ic" then
					return { bg = "#ff7eb6", fg = colors.bg }
				elseif mode == "v" or mode == "V" or mode == "\022" then
					return { bg = "#be95ff", fg = colors.bg }
				elseif mode == "R" then
					return { bg = "#3ddbd9", fg = colors.bg }
				elseif mode == "c" then
					return { bg = "#42be65", fg = colors.bg }
				elseif mode == "t" then
					return { bg = "#33b1ff", fg = colors.bg }
				end
			end,
			padding = { right = 1 },
		})

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.violet, gui = "bold" },
			cond = conditions.check_git_workspace,
		})

		ins_left({
			"diff",
			symbols = { added = "󰐕 ", modified = "󰏪 ", removed = "󰍴 " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.check_git_workspace,
		})

		-- Insert mid section. You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
		ins_left({
			function()
				if not conditions.check_git_workspace() then
					return "                    %="
				else
					return "%="
				end
			end,
		})

		ins_left({
			function()
				return require("nvim-treesitter").statusline({
					indicator_size = 70,
					type_patterns = { "function", "method" },
					separator = "  ",
				})
			end,
			icon = "󰊕:",
			color = { fg = "#7cb518", gui = "bold" },
		})

		ins_left({
			"diagnostics%=",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
			},
		})

		-- Add components to right sections

		ins_right({
			require("noice").api.status.search.get,
			cond = require("noice").api.status.search.has,
			icon = " ",
			color = { fg = colors.blue },
		})

		ins_right({
			require("noice").api.status.mode.get,
			cond = require("noice").api.status.mode.has,
			color = { fg = "#ff9e64" },
		})

		ins_right({
			require("noice").api.status.command.get,
			cond = require("noice").api.status.command.has,
			icon = "",
			color = { fg = "#ff9e64" },
		})

		ins_right({
			"filetype",
			-- fmt = string.upper,
			icons_enabled = true,
			color = { fg = colors.green, gui = "bold" },
		})

		ins_right({
			"o:encoding", -- option component same as &encoding in viml
			fmt = string.upper, -- I'm not sure why it's upper case either ;)
			color = { fg = colors.green, gui = "bold" },
		})

		ins_right({ "location", color = { fg = colors.fg, gui = "bold" } })

		ins_right({
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
		})

		-- WARN: If this component is not here, all lualine will fail to load???
		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.bg },
			padding = { left = -1 },
		})

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end,
}
