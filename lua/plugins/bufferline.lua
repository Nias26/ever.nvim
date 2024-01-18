return {
	"akinsho/bufferline.nvim",
   tag = "v4.3.0",
   dependencies ={ "nvim-tree/nvim-web-devicons" },
   config = function()
   	require("bufferline").setup{
      	options = {
				separator_style = 'thin',
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " "
						or (e == "warning" and " " or " " )
						s = s .. n .. sym
					end
					return s
				end,
				show_close_icon = false
			}
      }
   end
}
