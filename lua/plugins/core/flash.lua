return {
	"folke/flash.nvim",
   enabled = false,
	event = "VeryLazy",
   opts = {},
   keys = {
   	{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
   }
}
