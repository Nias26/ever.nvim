return {
	"nvim-mini/mini.nvim",
	version = false,
	event = { "InsertEnter", "BufReadPost", "BufNewFile" },
	keys = {
		{ mode = "n", "f" },
		{ mode = "n", "F" },
		{ mode = "n", "t" },
		{ mode = "n", "T" },
		{ mode = "n", "sa" },
		{ mode = "n", "sd" },
		{ mode = "n", "sf" },
		{ mode = "n", "sF" },
		{ mode = "n", "sh" },
		{ mode = "n", "sr" },
		{ mode = "n", "sn" },
		{ mode = "o", "a" },
		{ mode = "o", "i" },
		{ mode = "n", "g" },
	},
	config = function()
		require("mini.ai").setup()
		require("mini.cursorword").setup()
		require("mini.hipatterns").setup({
			highlighters = {
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})
		require("mini.indentscope").setup({
			draw = {
				predicate = function(scope)
					local ft = {
						"dashboard",
						"lazy",
						"checkhealth",
						"help",
						"man",
						"Terminal",
						"TelescopePrompt",
						"TelescopeResults",
						"mason",
						"qf",
					}
					return not scope.body.is_incomplete and not vim.tbl_contains(ft, vim.bo.filetype)
				end,
			},
			symbol = "|",
		})
		require("mini.jump").setup({
			keys = { "f", "F", "t", "T" },
			mappings = {
				forward = "f",
				backward = "F",
				forward_till = "t",
				backward_till = "T",
				repeat_jump = ";",
			},
			delay = {
				highlight = 250,
				idle_stop = 1500,
			},
		})
		require("mini.surround").setup()
	end,
}
