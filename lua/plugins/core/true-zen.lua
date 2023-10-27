return {
    "Pocco81/true-zen.nvim",
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
