return {
	"nvim-neorg/neorg",
	enabled = false,
	event = "Filetype norg",
	build = ":Neorg sync-parsers",
   dependencies = { "nvim-lua/plenary.nvim" },
   config = function()
   	require("neorg").setup {
      	load = {
         	["core.defaults"] = {}, -- Loads default behaviour
				["core.integrations.treesitter"] = {}, -- Treesitter integration
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
						name = "[Neorg]"
					}
				}, -- Code completion
	         ["core.concealer"] = {}, -- Adds pretty icons to your documents
	         ["core.dirman"] = { -- Manages Neorg workspaces
	            config = {
		            workspaces = {
		               notes = "~/notes",
							neovim = "~/.config/nvim/doc/"
		            },
						default_workspace = "notes",
		         },
	         },
				["core.export.markdown"] = {}, -- Export neorg files to markdown
				["core.integrations.nvim-cmp"] = {}, -- Code completion with nvim-cmp
				["core.syntax"] = {}, -- Syntax Highlightning for @code blocks
				["core.autocommands"] = {}, -- Autocommands
				["core.presenter"] = {
					config = {
						zen_mode = "truezen"
					}
				}, -- Beautiful presentations
				["core.mode"] = {}, -- Manage Neorg modes
				["core.queries.native"] = {}, -- Treesitter wrapper
				["core.ui"] = {}, -- UI Modules
				["core.ui.calendar"] = {}, -- Calendar
	      },
      }
   end,
}
