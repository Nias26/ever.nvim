return {
	"dgagn/diagflow.nvim",
	enabled = false,
	event = "LspAttach",
   opts = {},
   config = function()
   	require('diagflow').setup()
   end
}
