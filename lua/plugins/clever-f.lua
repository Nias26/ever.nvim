return {
	--[[ "echasnovski/mini.jump",
	version = false,
	config = function()
		require("mini.jump").setup({
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				forward = "f",
				backward = "F",
				forward_till = "t",
				backward_till = "T",
				repeat_jump = "",
			},

			-- Delay values (in ms) for different functionalities. Set any of them to
			-- a very big number (like 10^7) to virtually disable.
			delay = {
				-- Delay between jump and highlighting all possible jumps
				highlight = 250,

				-- Delay between jump and automatic stop if idle (no jump is done)
				idle_stop = 5000,
			},
		})
	end, ]]
	"rhysd/clever-f.vim",
	keys = {
		{ "f", mode = { "n", "v", "o" } },
		{ "F", mode = { "n", "v", "o" } },
		{ "t", mode = { "n", "v", "o" } },
		{ "T", mode = { "n", "v", "o" } },
	},
}
