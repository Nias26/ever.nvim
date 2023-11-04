return {
	"Pocco81/true-zen.nvim",
	enabled = false, -- Doesn't work with nvim-0.10.*
	event = "BufEnter",
   config = function()
   	require("true-zen").setup {
			integrations = {
		   	tmux = true,
		      twilight = true,
		      lualine = true,
		   },
		}
   end
}
