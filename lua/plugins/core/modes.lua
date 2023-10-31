return {
	"mvllow/modes.nvim",
	event = "BufEnter",
   config = function()
   	require("modes").setup({
      	colors = {
         	insert = "#be95ff",
            delete = "#ff7eb6",
            visual = "#82cfff",
            copy = "#42be65",
         }
      })
   end
}
