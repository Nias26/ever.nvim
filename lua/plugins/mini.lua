return {
	{
		"nvim-mini/mini.cursorword",
		event = "BufRead",
		version = "*",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"nvim-mini/mini.jump",
		version = "*",
		keys = {
			{ "f", mode = "n" },
			{ "F", mode = "n" },
			{ "t", mode = "n" },
			{ "T", mode = "n" },
		},
		config = function()
			require("mini.jump").setup({
				keys = { "f", "F", "t", "T" },
				mappings = {
					forward = "f",
					backward = "F",
					forward_till = "t",
					backward_till = "T",
					repeat_jump = ".",
				},
				delay = {
					highlight = 250,
					idle_stop = 1500,
				},
			})
		end,
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		keys = {
			{ "sa", mode = "n" },
			{ "sd", mode = "n" },
			{ "sf", mode = "n" },
			{ "sF", mode = "n" },
			{ "sh", mode = "n" },
			{ "sr", mode = "n" },
			{ "sn", mode = "n" },
		},
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"nvim-mini/mini.ai",
		version = "*",
		keys = {
			{ "a", mode = "o" },
			{ "i", mode = "o" },
			{ "g", mode = "n" },
		},
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"nvim-mini/mini.hipatterns",
		version = "*",
		event = "BufRead",
		config = function()
			require("mini.hipatterns").setup({
				highlighters = {
					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
				},
			})
		end,
	},
}
