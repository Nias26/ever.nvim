return {
	{
		"nvim-mini/mini.cursorword",
		event = {"BufReadPost", "BufNewFile" },
		version = "*",
		opts = {},
	},
	{
		"nvim-mini/mini.jump",
		version = "*",
		keys = {
			{ mode = "n", "f" },
			{ mode = "n", "F" },
			{ mode = "n", "t" },
			{ mode = "n", "T" },
		},
		opts = {
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
		},
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		keys = {
			{ mode = "n", "sa" },
			{ mode = "n", "sd" },
			{ mode = "n", "sf" },
			{ mode = "n", "sF" },
			{ mode = "n", "sh" },
			{ mode = "n", "sr" },
			{ mode = "n", "sn" },
		},
		opts = {},
	},
	{
		"nvim-mini/mini.ai",
		version = "*",
		keys = {
			{ mode = "o", "a" },
			{ mode = "o", "i" },
			{ mode = "n", "g" },
		},
		opts = {},
	},
	{
		"nvim-mini/mini.hipatterns",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("mini.hipatterns").setup({
				highlighters = {
					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
				},
			})
		end,
	},
}
