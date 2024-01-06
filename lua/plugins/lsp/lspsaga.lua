return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local status_ok, lspsaga = pcall(require, "lspsaga")
		if not status_ok then
			return
		end

		lspsaga.setup({
			ui = {
				code_action = "󰌵",
				border = 'solid',
				expand = '',
				collapse = '',
			},
			symbol_in_winbar = {
				enable = true
			},
			lightbulb = {
				enable = true,
				sign = false
			},
			implement = {
				enable = false
			}
		})
	end
}
