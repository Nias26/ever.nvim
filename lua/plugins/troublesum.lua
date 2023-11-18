return {
	"ivanjermakov/troublesum.nvim",
	event = "LspAttach",
   config = function()
   	require("troublesum").setup()
   end
}
