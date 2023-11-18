return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
   opts = {},
	name = "ibl",
   config = function()
		local highlight = {
			"RainbowGray"
		}
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowGray", { fg = "#65676F" })
		end)
		require("ibl").setup{
			exclude = {
         	buftypes = { 'alpha', 'dashboard', 'lspinfo', 'lazy', 'checkhealth', 'help', 'man', 'Terminal', 'TelescopePrompt', 'TelescopeResults', 'mason' },
            filetypes = { 'alpha', 'dashboard', 'lspinfo', 'lazy', 'checkhealth', 'help', 'man', 'Terminal', 'TelescopePrompt', 'TelescopeResults', 'mason' },
			},

			indent = {
				highlight = {"Whitespace"},
				char = "|",
				smart_indent_cap = true,
			},

			whitespace = {
				highlight = {"Whitespace"},
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = false,
				injected_languages = true,
				highlight = highlight,
			}
	   }
	end
}
