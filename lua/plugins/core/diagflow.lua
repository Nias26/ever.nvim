return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
   opts = {},
   config = function()
   	require('diagflow').setup()
   end
}
