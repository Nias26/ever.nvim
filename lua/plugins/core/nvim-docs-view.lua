return {
	"amrbashir/nvim-docs-view",
	cmd = { "DocsViewToggle" },
	config = function()
    	require("docs-view").setup{
			position = "right",
		    width = 60,
	    }
	end
}
