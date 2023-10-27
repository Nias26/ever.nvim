return {
	"lvim-tech/lvim-fm",
	enabled = false,
	lazy = true,
	dependencies = { "lvim-tech/lvim-shell" },
	config = function()
    	require("lvim-fm").setup({
		    -- your configuration comes here
	    	-- or leave empty to use the default settings
	    env = {
		    FZF_DEFAULT_OPTS="--ansi",
	    },
	  })
  end
}
