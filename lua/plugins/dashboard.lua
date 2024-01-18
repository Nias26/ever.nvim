return {
	"glepnir/dashboard-nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('dashboard').setup({
			theme = 'hyper',
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = ' New File',
						group = '@property',
						action = 'new',
						key = 'n'
					},
					{
						desc = ' Search',
						group = '@string',
						action = 'Telescope find_files',
						key = 't',
					},
					{
						desc = '󰠮 Projects',
						group = 'Exception',
						action = 'Telescope projects',
						key = 'p',
					},
					{
						desc = ' lazy',
						group = 'Number',
						action = 'Lazy',
						key = 'l',
					},
					{
						desc = '󰑓 Reload Last Session',
						group = '@variable',
						action = 'lua require("persistence").load({ last = true })',
						key = 'r',
					},
				},
				project = { enable = false	},
				footer = { ' ', ' ever.nvim '},
			}
		})
	end
}
