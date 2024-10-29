return {
	"akinsho/bufferline.nvim",
	dependencies = {
		{
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup({})
			end,
		},
	},
	-- WARN:Do not set lazy-loaing on bufferline, or it won't show!
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.no_italic,
				themable = true,
				numbers = "none",
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				diagnostics = false,
				color_icons = true,
				get_element_icon = function(element)
					local icon, hl =
						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
				end,
				show_buffer_icons = true,
				show_buffer_clone_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				show_duplicate_prefix = false,
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				sort_by = "insert_at_end",
			},
		})
	end,
}
