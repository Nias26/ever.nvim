return {
	"akinsho/bufferline.nvim",
	-- WARN:Do not set lazy-loaing on bufferline, or it won't show!
	tag = "v4.3.0",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("bufferline").setup({
			---@diagnostic disable-next-line: missing-fields
			options = {
				separator_style = "thin",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end,
				show_close_icon = false,
			},
		})
	end,
}
