return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	config = function()
		local lualine = require("lualine")
		local noice = require("noice")

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")

				if not gitdir or #gitdir == 0 or #gitdir >= #filepath then
					return false
				end

				require("lazy").load({ plugins = { "vim-fugitive" } })
				return true
			end,
		}

		lualine.setup({
			options = {
				component_separators = " ",
				section_separators = "",
				theme = "auto",
			},
			sections = {
				lualine_a = {
					{
						function()
							local mode = vim.api.nvim_get_mode().mode
							local labels = {
								n = "RW",
								nt = "RW",
								i = "**",
								ic = "**",
								v = "**",
								V = "**",
								["\022"] = "**",
								o = "!!",
								no = "!!",
								s = "!!",
								R = "RA",
								c = "VIEX",
								t = "",
							}
							return " " .. (labels[mode] or mode) .. " "
						end,
						padding = { left = 0, right = 0 },
					},
				},
				lualine_b = {
					{
						"filename",
						file_status = false,
						symbols = false,
						color = function()
							if vim.bo.readonly then
								return { bg = "NONE", fg = "#ee5396" }
							elseif vim.bo.modified then
								return { bg = "NONE", fg = "#3ddbd9" }
							end
						end,
						cond = conditions.buffer_not_empty,
						padding = 1,
					},
				},
				lualine_c = {
					{
						function()
							local branch = vim.fn.FugitiveHead()
							if branch == "" then
								return ""
							end
							return string.format("(λ  #%s) ", branch)
						end,
						icon = "",
						color = { gui = "bold" },
						cond = conditions.check_git_workspace,
						padding = { left = 0, right = 1 },
					},
				},
				lualine_x = {
					{
						noice.api.status.mode.get,
						cond = noice.api.status.mode.has,
						color = { fg = "#ee5396" },
						padding = 1,
					},
					{
						noice.api.status.command.get,
						cond = noice.api.status.command.has,
						icon = "",
						color = { fg = "#42be95" },
						padding = 1,
					},
				},
				lualine_y = {
					{
						function()
							return #vim.diagnostic.get(0, {
								severity = vim.diagnostic.severity.WARN,
							})
						end,
						color = { fg = "#be95ff" },
						padding = 0,
					},
					{
						function()
							return #vim.diagnostic.get(0, {
								severity = vim.diagnostic.severity.ERROR,
							})
						end,
						color = { fg = "#ee5396" },
						padding = 0,
					},
					{
						"filetype",
						icons_enabled = false,
						padding = { left = 1 },
					},
					{
						"location",
						padding = 0,
					},
				},
				lualine_z = {},
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
