return {
	"amrbashir/nvim-docs-view",
	lazy = true,
	cmd = { "DocsViewToggle" },
	config = function()
    	require("docs-view").setup{
			position = "right",
		    width = 60,
	    }
	end
}
