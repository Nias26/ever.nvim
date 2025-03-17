return {
	"akinsho/bufferline.nvim",
	event = "TabNew",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup()
			end,
		},
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs", -- set to "tabs" to only show tabpages instead
				style_preset = require("bufferline").style_preset.no_italic,
				numbers = "none",
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
				diagnostics = false,
				custom_filter = function(buf)
					return false -- Show only tabs
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "Files",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				get_element_icon = function(element)
					-- element consists of {filetype: string, path: string, extension: string, directory: string}
					-- This can be used to change how bufferline fetches the icon
					-- for an element e.g. a buffer or a tab.
					-- e.g.
					local icon, hl =
						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
				end,
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = false,
			},
		})
	end,
}
