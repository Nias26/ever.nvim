return {
	"echasnovski/mini.cursorword",
	event = "BufRead",
   version = "*",
   config = function()
   	require("mini.cursorword").setup()
   end
}
