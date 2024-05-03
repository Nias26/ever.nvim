return {
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
				repeat_jump = "",
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
	--[[ "rhysd/clever-f.vim",
	keys = {
		{ "f", mode = { "n", "v", "o" } },
		{ "F", mode = { "n", "v", "o" } },
		{ "t", mode = { "n", "v", "o" } },
		{ "T", mode = { "n", "v", "o" } },
	}, ]]
}