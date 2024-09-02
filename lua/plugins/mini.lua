return {
	{
		"echasnovski/mini.cursorword",
		event = "BufRead",
		version = "*",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.jump",
		version = "*",
		keys = { "f", "F", "t", "T" },
		config = function()
			require("mini.jump").setup({
				-- module mappings. use `''` (empty string) to disable one.
				mappings = {
					forward = "f",
					backward = "F",
					forward_till = "t",
					backward_till = "T",
					repeat_jump = ".",
				},

				-- delay values (in ms) for different functionalities. set any of them to
				-- a very big number (like 10^7) to virtually disable.
				delay = {
					-- delay between jump and highlighting all possible jumps
					highlight = 250,

					-- delay between jump and automatic stop if idle (no jump is done)
					idle_stop = 1500,
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		keys = { "sa", "sd", "sf", "sF", "sh", "sr", "sn" },
		config = function()
			require("mini.surround").setup()
		end,
	},
}
