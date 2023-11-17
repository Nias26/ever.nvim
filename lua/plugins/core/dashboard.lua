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
						desc = ' New File ',
						group = '@property',
						action = 'new',
						key = 'n'
					},
	                -- Example
	                --{
	                --  icon = ' ',
	                --  icon_hl = '@variable',
	                --  desc = 'Files',
	                --  group = 'Label',
	                --  action = 'Telescope find_files',
	                --  key = 'f',
	                --},
	            {
		         	desc = ' Search ',
		            group = '@string',
		            action = 'Telescope find_files',
		            key = 't',
		         },
	            {
		         	desc = ' lazy ',
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
				project = {
					enable = true,
					limit = 10,
					icon = '󰠮 ',
					label = "Projects",
					action = 'Telescope projects cwd=',
				},
				footer = { " ", " ever.nvim " },
			},
		})
		vim.api.nvim_set_hl(0, 'dashboardFooter', { fg='#08A045'})
	end
}
