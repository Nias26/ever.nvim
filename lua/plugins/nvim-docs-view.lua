return {
	"amrbashir/nvim-docs-view",
	lazy = true,
	cmd = { "DocsViewToggle" },
	config = function()
		require("docs-view").setup{
			position = "right",
			update_moe = "auto",
	   }
	end
}
